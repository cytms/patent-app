class StatController < ApplicationController
  before_filter :connect_db

  def index
    # input: params[:ASS]

    # patentcounter_line -cytms
    # render: integer @count
    @assignee_name = 'Samsung'
    @patent = Array.new
    @counter = Array.new
    (2007..2008).each{|i|
      @patent = @db.query("select `Patent_id` from `assignee_" + i.to_s + "` where `Assignee` like '%" + 'Samsung' + "%'")
      @counter << @patent.size
    }

    # inventor_bar -andikan
    # output: string @query_result
    
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
  
  def inventor_bar
  	@assignee_name = 'Samsung'
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
  	
  	# @patent_ids = []
  	# @patent_id_in_assignee.map {|p| @patent_ids.push(p['Patent_id'])}
  	# @patent_ids_string = @patent_ids[0..1000].join(',')
  	# @inventor_in_assginee = @db.query("select `Name` from `inventor_2007` where `Patent_id` in (#{@patent_ids_string})")
  end

  def search_index
  end

  def searchPID
    #render :text => "OK!!!!!!!!!!!!"
    @patent = Array.new
    (2003..2008).each { |i|
      @patent[i] = @db.query("SELECT `Patent_id`, `Title`, `Issued_date`, `Filed_Date`, `Abstract`, `Claims`, `Summary`
                                  FROM `patent_" + i.to_s + "` 
                                  WHERE `Patent_id` = '"+params[:patentID]+"'")
    }
    #@inventor = @db.query("select * from `inventor_2007` where `Patent_id` = '"+params[:patentID]+"'")
    #@assignee = @db.query("select * from `assignee_2007` where `Patent_id` = '"+params[:patentID]+"'")
    #render :inline => "<% @patent.each do |r| %><%= r.to_s %><% end %><br><% @inventor.each do |r| %><%= r.to_s %><% end %><br><% @assignee.each do |r| %><%= r.to_s %><% end %>"
  end

  def searchINV
    @patentID = Array.new
    temp = Array.new
    temp = params[:INV].split(%r{\s})
    count = temp.length

    (2007..2008).each { |i|
    @patentID[i] = @db.query("SELECT `Patent_id`
                                  FROM `inventor_" + i.to_s + "` 
                                  WHERE (inventor_" + i.to_s + ".Name LIKE '%#{temp[0]}%') AND
                                          (inventor_" + i.to_s + ".Name LIKE '%#{temp[1]}%') AND
                                          (inventor_" + i.to_s + ".Name LIKE '%#{temp[2]}%')")
    }
  end

  private
  def connect_db
    @db = Mysql2::Client.new(:host => '140.112.107.1', :username => 'chuya', :password=> '0514', :database => 'patentproject2012', :encoding => 'utf8')
  end

end
