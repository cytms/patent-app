class CitationController < ApplicationController
  before_filter :connect_db #, :except =>[:index]
  def index
  	# cytms_test_code
  	@test = Array.new
  	@test = @db.query("select `patent_id` from `patent-referencedby_1976` limit 0, 10").to_a

  end

  private
  def connect_db
    @db = Mysql2::Client.new(:host => '140.112.107.1', :username => 'chuya', :password=> '0514', :database => 'mypaper', :encoding => 'utf8')
  end
end
