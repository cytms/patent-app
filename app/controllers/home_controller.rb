class HomeController < ApplicationController
  before_filter :connect_db, :except =>[:index]

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
    @patentID = @db.query("select `Patent_id` from `assignee_2007` where `Assignee` like '%"+params[:ASS]+"%'")
    @array = Array.new
    @patentID.each do |p|
      params[:patent] = @db.query("select `Patent_id`, `Abstract` from `patent_2007` where `Patent_id` = '"+p['Patent_id']+"'")
      @array << params[:patent].to_a[0]
    end
    #render :inline => "<% @array.each do |a| %><%= a.to_s %><% end %>"
  end

private
	def connect_db
		@db = Mysql2::Client.new(:host => '140.112.107.1', :username => 'chuya', :password=> '0514', :database => 'patentproject2012', :encoding => 'utf8')
	end
end