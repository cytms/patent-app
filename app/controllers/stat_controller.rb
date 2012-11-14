class StatController < ApplicationController
  before_filter :connect_db

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
