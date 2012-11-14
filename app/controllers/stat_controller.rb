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

  private
  def connect_db
    @db = Mysql2::Client.new(:host => '140.112.107.1', :username => 'chuya', :password=> '0514', :database => 'patentproject2012', :encoding => 'utf8')
  end

end
