# graph_controller.rb

class GraphController < ApplicationController
  before_filter :connect_db #, :except =>[:index]
  layout "graph"

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
  	#
  end

  def connect_db
    @db = Mysql2::Client.new(:host => '140.112.107.1', :username => 'chuya', :password=> '0514', :database => 'patentproject2012', :encoding => 'utf8')
  end
end