class HomeController < ApplicationController
  before_filter :connect_db#, :except =>[:index]

  def index  	
  	 #@res = @db.query("select * from `inventor_2007` limit 0,10")
    #params[:test] = 'D558365'
    #@res = @db.query("select * from `patent_2007` where `Patent_id` = '"+params[:test]+"'")
  end

  def searchPID
  	#render :text => "OK!!!!!!!!!!!!"
    @patent = @db.query("select * from `patent_2007` where `Patent_id` = '"+params[:patentID]+"'")
    @inventor = @db.query("select * from `inventor_2007` where `Patent_id` = '"+params[:patentID]+"'")
    @assignee = @db.query("select * from `assignee_2007` where `Patent_id` = '"+params[:patentID]+"'")
    #render :inline => "<% @patent.each do |r| %><%= r.to_s %><% end %><br><% @inventor.each do |r| %><%= r.to_s %><% end %><br><% @assignee.each do |r| %><%= r.to_s %><% end %>"
  end

def searchINV
    @patentID = @db.query("select `Patent_id` from `inventor_2007` where `Name` like '%"+params[:INV]+"%'")
    #@array = Array.new
    #@patentID.each do |p|
    #  params[:patent] = @db.query("select `Patent_id`, `Abstract` from `patent_2007` where `Patent_id` = '"+p['Patent_id']+"'")
    #  @array << params[:patent].to_a[0]
    #end
    #render :inline => "<% @array.each do |a| %><%= a.to_s %><% end %>"
  end

  def searchASS
    @assignee_name = params[:companyIn]
    @patent = Array.new
    @count = Array.new
    (2007..2008).each{|i|
      @patent = @db.query("select `Patent_id` from `assignee_" + i.to_s + "` where `Assignee` like '%" + @assignee_name.to_s + "%'")
      @count << @patent.size
    }


    @result = @db.query("SELECT  `Assignee`, `Name`, COUNT( inventor_2007.Name )
                               FROM  `assignee_2007` 
                               LEFT JOIN  `inventor_2007` 
                               USING ( Patent_id ) 
                               WHERE assignee_2007.Assignee
                               REGEXP  '#{@assignee_name}'
                               GROUP BY inventor_2007.Name
                               ORDER BY 3 DESC 
                               LIMIT 0d , 30")
    @query_result = @result.to_a
    #array = Array.new
    #@patentID.each do |p|
    #  params[:patent] = @db.query("select `Patent_id`, `Abstract` from `patent_2007` where `Patent_id` = '"+p['Patent_id']+"'")
    #  @array << params[:patent].to_a[0]
    #end
    #render :inline => "<% @array.each do |a| %><%= a.to_s %><% end %>"
  end

  def searchCompany
    @possibleNames = @db.query("select `name` from `abbreviations` where `abbreviation`='#{params[:companyIn]}'")
    
    @results = Array.new
    if @possibleNames.to_a.empty? #if the :companyIn is not an abbreviation of a company, search for similar names
      @results << params[:companyIn]
    else  
      @possibleNames.each do |p|
        @results << p['name']
      end
    end
    render :text => @results

  end

def IPCPieChart
  # NUMBER CHECK
  if params[:layer].nil? == true
    params[:layer] = 0
    @layer = params[:layer]
  else
    @layer = params[:layer].to_i
  end

  if @layer == 0
    #@patentID = @db.query("select `Patent_id` from `ipc_2007` limit 0,8")
    @patentID = @db.query("select `Patent_id` from `assignee_2007` where `Assignee` like '%Kohler%' limit 0,7")
    #@patentID = @db.query("select `Patent_id` from `assignee_2007` where `Assignee` like '%"+params[:ASS]+"%'")
    @array = Array.new
    
    @patentID.each do |p|
      params[:patent] = @db.query("select * from `ipc_2007` where `Patent_id` = '"+p['Patent_id']+"'")
      $k = params[:patent].to_a.length
      for i in 0..$k-1
        if params[:patent].to_a[i]['IPC_class'][0] =~ /\D/
          @array.push( params[:patent].to_a[i] )
        end
      end
    end

    @arraySorted = @array.sort! { |x,y| x["IPC_class"] <=> y["IPC_class"] }

    @array_hash = Array.new
    for j in 0..4
      @array_hash[j] = Hash.new
    end

    $k = @arraySorted.length
    
    for i in 0..$k-1
      # splitting IPC into 5 segments
      iPCchar_array = Array.new
      a = @arraySorted[i]["IPC_class"].to_s
      for n in [0,2,3]
        iPCchar_array << a[0..n]
      end
      iPCchar_array << a.partition(/\//)[0] + "/00"
      iPCchar_array << a

      for j in 0..4
        if @array_hash[j].has_key?(iPCchar_array[j]) == true
          @array_hash[j][iPCchar_array[j]] += 1
        else
          @array_hash[j].store(iPCchar_array[j], 1)
        end
      end
    end
    
    @result = @array_hash

  else
    @result = flash[:result]
  end
end

private
	def connect_db
		@db = Mysql2::Client.new(:host => '140.112.107.1', :username => 'chuya', :password=> '0514', :database => 'patentproject2012', :encoding => 'utf8')
	end
end