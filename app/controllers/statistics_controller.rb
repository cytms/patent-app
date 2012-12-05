# statistics_controller.rb

class StatisticsController < ApplicationController
  before_filter :connect_db #, :except =>[:index]
  layout "graph", :except => [:index, :graph]

  def index

  end

  def graph
  	#layout "application"
  	$graph_companyIn = params[:companyIn].to_s
    $graph_beginTime = params[:beginTime].to_i
    $graph_endTime = params[:endTime].to_i
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
  
  def patentList
  	# alice
    @assignee_name = $graph_companyIn
    @start_year = $graph_beginTime
    @end_year = $graph_endTime

    @patent = Array.new
    (@start_year..@end_year).each{ |i|
      @patent[i] = @db.query("SELECT `Patent_id`, `Title`, `Issued_date`, GROUP_CONCAT(Name) AS `Name`                              
                              FROM `assignee_" + i.to_s + "`
                              LEFT JOIN `patent_" + i.to_s + "`
                              USING ( Patent_id ) 
                              LEFT JOIN `inventor_" + i.to_s + "`
                              USING ( Patent_id )  
                              WHERE `Assignee` LIKE '%" + @assignee_name.to_s + "%'
                              GROUP BY Patent_id")
    }
  end

  def countLineChart
  	# edited by cytms
  	@assignee_name = $graph_companyIn
  	@start_year = $graph_beginTime
  	@end_year = $graph_endTime

    @patent = Array.new
    @count = Array.new
    (@start_year..@end_year).each{|i|
      @patent = @db.query("select `Patent_id` from `assignee_" + i.to_s + "` where `Assignee` like '%" + @assignee_name.to_s + "%'")
      @count << @patent.size
    }
    #render :text => @results
  end

  def inventorBarChart
  	# edited by anikan
  	@assignee_name = $graph_companyIn
    @result = @db.query("SELECT  `Assignee`, `Name`, COUNT( inventor_2007.Name )
                               FROM  `assignee_2007` 
                               LEFT JOIN  `inventor_2007` 
                               USING ( Patent_id ) 
                               WHERE assignee_2007.Assignee
                               REGEXP  '#{@assignee_name}'
                               GROUP BY inventor_2007.Name
                               ORDER BY 3 DESC 
                               LIMIT 0 , 30")
    @query_result = @result.to_a
  end

  def IPCPieChart
  @assignee_name = $graph_companyIn
  @start_year = $graph_beginTime
  @end_year = $graph_endTime
  @iPC_data = Array.new
  temp = Array.new
  @arraySorted = Array.new
  
  (@start_year..@end_year).each{ |i|
      @iPC_data = @db.query("SELECT  `Patent_id`, `IPC_class`
                                  FROM  `assignee_" + i.to_s + "` 
                                  LEFT JOIN  `ipc_" + i.to_s + "` 
                                  USING ( Patent_id ) 
                                  WHERE assignee_" + i.to_s + ".Assignee
                                  REGEXP  '#{@assignee_name}'
                                  ORDER BY 2 ASC")
      @arraySorted = (temp << @iPC_data.to_a).flatten
  }

  #@arraySorted = @iPC_data.to_a

  @result = Array.new
  @array_hash = Array.new
	for j in 0..4
	  @array_hash[j] = Hash.new
	end

	$k = @arraySorted.length

	for i in 0..$k-1
	  # splitting IPC into 5 segments
	  if @arraySorted[i]["IPC_class"].to_s != "" && @arraySorted[i]["IPC_class"].to_s[0] =~ /\D/
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
         @result[j] = @array_hash[j].to_a.to_json
	    end #end for
	  end #end if
  end #end for
end

  private
  def connect_db
    @db = Mysql2::Client.new(:host => '140.112.107.1', :username => 'chuya', :password=> '0514', :database => 'patentproject2012', :encoding => 'utf8')
  end
end