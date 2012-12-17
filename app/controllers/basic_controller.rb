class BasicController < ApplicationController
  before_filter :connect_db #, :except =>[:index]
  layout "graph", :except => [:index]
  
  def index

  end

  def searchPID
    #render :text => "OK!!!!!!!!!!!!"
    @patent = Array.new
    (2003..2008).each { |i|
      @patent[i] = @db.query("SELECT `Patent_id`, `Title`, `Issued_date`, `Filed_Date`, `Abstract`, `Claims`, `Summary`, `Name`, `Assignee`
                                  FROM `patent_" + i.to_s + "`
                                  LEFT JOIN `inventor_" + i.to_s + "`
                                  USING ( Patent_id )
                                  LEFT JOIN `assignee_" + i.to_s + "`
                                  USING ( Patent_id )
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
    @size = 0

    (2007..2008).each { |i|
    @patentID[i] = @db.query("SELECT `Patent_id`, `Title`
                                  FROM `inventor_" + i.to_s + "`
                                  LEFT JOIN `patent_" + i.to_s + "`
                                  USING ( Patent_id )  
                                  WHERE (inventor_" + i.to_s + ".Name LIKE '%#{temp[0]}%') AND
                                          (inventor_" + i.to_s + ".Name LIKE '%#{temp[1]}%') AND
                                          (inventor_" + i.to_s + ".Name LIKE '%#{temp[2]}%')")
    @size += @patentID[i].to_a.count
    }
    render :layout => false
  end
  
def searchASS
end

def searchTITLE
  @patentID = Array.new
  keywords = Array.new
  keywords = params[:TITLE].split(%r{\s})
  count = keywords.length
  @size = 0
  n = 1

  tempQuery = "(`Title` LIKE '%" + keywords[0] + "%')"
  while n < count do
    tempQuery << "AND (`Title` LIKE '%" + keywords[n] + "%')"
    n += 1
  end

  (2007..2008).each { |i|
    @patentID[i] = @db.query("SELECT `Patent_id`, `Title`, `Name`, `Assignee`
                                  FROM `patent_" + i.to_s + "`
                                  LEFT JOIN `inventor_" + i.to_s + "`
                                  USING ( Patent_id ) 
                                  LEFT JOIN `assignee_" + i.to_s + "`
                                  USING ( Patent_id )
                                  WHERE " + tempQuery + " GROUP BY Patent_id")
    @size += @patentID[i].to_a.count
  }

  render :layout => false
end

  private
  def connect_db
    @db = Mysql2::Client.new(:host => '140.112.107.1', :username => 'chuya', :password=> '0514', :database => 'patentproject2012', :encoding => 'utf8')
  end
end