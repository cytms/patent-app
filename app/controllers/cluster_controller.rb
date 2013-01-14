class ClusterController < ApplicationController
  before_filter :connect_db
  layout "graph", :except => [:index]

	def index
		# query cluster data
		
	end
	
	def chart
		# for alice
		@query = @db.query("select * from `carts` where 1").to_a.first
    if @query["content"].nil? == true then
      @result_patents = nil
    else
      @tmp = @query["content"].to_s.chomp("\\")
      @result_patents = JSON.parse(@tmp)
    end

	end

  private
  def connect_db
    @db = Mysql2::Client.new(:host => '140.112.107.1', :username => 'chuya', :password=> '0514', :database => 'patentproject2012', :encoding => 'utf8')
  end
end
