class CartController < ApplicationController
  before_filter :connect_db #, :except =>[:index]
  
  def index
    # [{"patents"=>"[{\"patent_id\"=>\"1\", \"issued_year\"=>\"2007\", \"title\"=>\"hello\", \"assignee\"=>\"NTU\"}]"}] 
    #@test = Array.new
    @data = Array.new
    @data = [{"patent_id"=>"1", "issued_year"=>"2007", "title"=>"hello", "assignee"=>"NTU"}]
    #@test = data[0]["patent_id"].to_s
    @query = @db.query("select `patents` from `carts` limit 1, 1").to_a.first
    @tmp = @query["patents"].to_s.chomp("\\")
    @test = JSON.parse(@tmp)
    @test.each{|patent|
      patent.each{|x, y|}
      puts "============="
      puts patent.keys
      puts "============="
    }
    #s@test2 = JSON.parse(@test).to_s.chomp("\\")
    #@test = JSON.parse(@query)

    #puts "========================"
    #@test2 = @test[0]["patents"].to_s.chomp("\\")
    #@test3 = Array.new
    #@test3 = @test2
    #puts "test3[0] = " + @test3[0]
    #puts @test2
    #puts "========================"

  end
  
  private
  def connect_db
    @db = Mysql2::Client.new(:host => '140.112.107.1', :username => 'chuya', :password=> '0514', :database => 'patentproject2012', :encoding => 'utf8')
  end
end