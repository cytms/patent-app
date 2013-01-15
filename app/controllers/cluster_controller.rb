class ClusterController < ApplicationController
  before_filter :connect_db
  layout "graph", :except => [:index]

	def index
		# query cluster data
		@q = @db.query("SELECT `content` FROM `ir-project` WHERE `assignee` LIKE '%sony%'").to_a.first

     if @q['content'].nil? == true then
        @patents = nil
     else
        @temp = @q["content"].to_s
        @patents = eval(@temp)
        @result_list = Array.new #array of arrays
        @patents.each{|key, value|
          a = Array.new
          a[0] = key
          
          i = 1
          for i in (1..value.count)
            a[i] = value[i-1].chomp(".txt")
          end
          @result_list << a
        }

	   end
   end
	
	def chart
		# for alice
		@query = @db.query("SELECT `content` FROM `ir-project` WHERE `assignee` LIKE '%sony%'").to_a.first

    if @query['content'].nil? == true then
      @result_patents = nil
    else
      @tmp = @query["content"].to_s
      @result_patents = eval(@tmp) #{"cluster" => [patentid1, patentid2]}
      @result_temp = Array.new
      j = 1
      @result_patents.each{ |key, value|
        a = Array.new
        a[0] = "Cluster " + j.to_s
        j += 1
        a[1] = value.count
        @result_temp << a
      }
      @result = @result_temp.to_json
    end

	end

  private
  def connect_db
    @db = Mysql2::Client.new(:host => '140.112.107.1', :username => 'chuya', :password=> '0514', :database => 'patentproject2012', :encoding => 'utf8')
  end
end
