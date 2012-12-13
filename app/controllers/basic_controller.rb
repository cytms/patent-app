class BasicController < ApplicationController
  before_filter :connect_db #, :except =>[:index]
  
  def index

  end

  def searchPID
    #render :text => "OK!!!!!!!!!!!!"
    @patent = Array.new
    (2003..2008).each { |i|
      @patent[i] = @db.query("SELECT `Patent_id`, `Title`, `Issued_date`, `Filed_Date`, `Abstract`, `Claims`, `Summary`
                                  FROM `patent_" + i.to_s + "` 
                                  WHERE `Patent_id` = '"+params[:patentID]+"'")
    }
    render :layout => false
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
    @patentID[i] = @db.query("SELECT `Patent_id`, `Title`
                                  FROM `inventor_" + i.to_s + "`
                                  LEFT JOIN `patent_" + i.to_s + "`
                                  USING ( Patent_id )  
                                  WHERE (inventor_" + i.to_s + ".Name LIKE '%#{temp[0]}%') AND
                                          (inventor_" + i.to_s + ".Name LIKE '%#{temp[1]}%') AND
                                          (inventor_" + i.to_s + ".Name LIKE '%#{temp[2]}%')")
    }
    render :layout => false
  end
  
  private
  def connect_db
    @db = Mysql2::Client.new(:host => '140.112.107.1', :username => 'chuya', :password=> '0514', :database => 'patentproject2012', :encoding => 'utf8')
  end
end