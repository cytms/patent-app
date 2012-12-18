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

  def addPatent
  	#query current user's cart
  	@db = Mysql2::Client.new(:host => '140.112.107.1', :username => 'chuya', :password=> '0514', :database => 'patentproject2012', :encoding => 'utf8')
  	@userCart = @db.query("select `patents` from `carts` where `user_id`='#{current_user.id}'")   
    if @userCart.to_a.empty?
    	#create new cart for user
		@db.query("INSERT INTO `patentproject2012`.`carts` (`user_id`) VALUES ( '#{current_user.id}')")   
		###error handling?
		#@cart = Array.new()
    end#else#user already has a cart
	if @userCart.to_a[0]['patents'].nil?
		@cart = Array.new()
	else
		@cart = JSON.parse(@userCart.to_a[0]['patents'])
		@cart.each do |patent|
		#check for duplicate patent entry#####
		end
	end
    #end
	@new = Hash.new()						#updating cart database
	@new['patent_id'] = params[:patentID]
	@new['issued_year'] = params[:year]
	@new['title'] = params[:title]
	@new['assignee'] = params[:assignee]
	@cart << @new
	success = @db.query("UPDATE `carts` SET `patents`='#{@cart.to_json}' WHERE `user_id`='#{current_user.id}'")
	if success.nil?
		message = "Patent #{params[:patentID]} added"
	else
		message = "Failed to add patent #{params[:patentID]}"
	end
    render :json => message.to_json
    #render :layout => false
  end
  
  private
  def connect_db
    @db = Mysql2::Client.new(:host => '140.112.107.1', :username => 'chuya', :password=> '0514', :database => 'patentproject2012', :encoding => 'utf8')
  end
end