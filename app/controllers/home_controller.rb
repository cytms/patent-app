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
    @patent = Array.new
    @count = Array.new
    (2007..2008).each{|i|
      @patent = @db.query("select `Patent_id` from `assignee_" + i.to_s + "` where `Assignee` like '%" + params[:ASS] + "%'")
      @count << @patent.size
    }
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

private
	def connect_db
		@db = Mysql2::Client.new(:host => '140.112.107.1', :username => 'chuya', :password=> '0514', :database => 'patentproject2012', :encoding => 'utf8')
	end
end