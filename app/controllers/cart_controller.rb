class CartController < ApplicationController
  before_filter :connect_db , :authenticate_user!

  def index
    @query = @db.query("select * from `carts` where `user_id`=#{current_user.id}").to_a.first
    if @query["patents"].nil? == true then
      @result_patents = nil
    else
      @tmp = @query["patents"].to_s.chomp("\\")
      @result_patents = JSON.parse(@tmp)
    end

    #group
    @query = @db.query("select * from `carts` where `user_id`=#{current_user.id}").to_a.first
    if @query["groups"].nil? == true then
      @result_groups = nil
    else
      @tmp = @query["groups"].to_s.chomp("\\")
      @result_groups = JSON.parse(@tmp)
    end
  end

  def addPatent
  	#query current user's cart
  	@userCart = @db.query("select `patents` from `carts` where `user_id`='#{current_user.id}'")   
    if @userCart.to_a.empty?
    	#create new cart for user
		@db.query("INSERT INTO `patentproject2012`.`carts` (`user_id`) VALUES ( '#{current_user.id}')")   
    end
    @userCart = @db.query("select `patents` from `carts` where `user_id`='#{current_user.id}'")
	if @userCart.to_a[0]['patents'].nil?
		@cart = Array.new()
	else
		@cart = JSON.parse(@userCart.to_a[0]['patents'])
	end
	@new = Hash.new()						#updating cart database
	@new['patent_id'] = params[:patentID]
	@new['issued_year'] = params[:year]
	@new['title'] = params[:title]
	@new['assignee'] = params[:assignee]

	if !@cart.include?(@new)				#check for duplicate patent entry
		@cart << @new
		success = @db.query("UPDATE `carts` SET `patents`='#{@cart.to_json}' WHERE `user_id`='#{current_user.id}'")
		if success.nil?
			message = "Patent #{params[:patentID]} added"
		else
			message = "Failed to add patent #{params[:patentID]}"
		end
	else
		message = "#{params[:patentID]} already added to cart"
	end
    render :json => message.to_json
  end

  def addGroup
  	#@assignee = JSON.parse(params[:assignee])
  	params[:assignee].each { |s| s = s.strip }
  	@userCart = @db.query("select `groups` from `carts` where `user_id`='#{current_user.id}'")   
    if @userCart.to_a.empty?
    	#create new cart for user
		@db.query("INSERT INTO `patentproject2012`.`carts` (`user_id`) VALUES ( '#{current_user.id}')")   
    end

    @userCart = @db.query("select `groups` from `carts` where `user_id`='#{current_user.id}'")
	if @userCart.to_a[0]['groups'].nil?
		@cart = {}
	else
		@cart = JSON.parse(@userCart.to_a[0]['groups'])
	end

	#check for duplicate group entry
	if !@cart.keys.include?( params[:assignee][0] )
		#updating cart database
		@cart[params[:assignee][0]] = params[:assignee]
		success = @db.query("UPDATE `carts` SET `groups`='#{@cart.to_json}' WHERE `user_id`='#{current_user.id}'")
		if success.nil?
			message = "Group #{params[:assignee][0]} added"
		else
			message = "Failed to add patent #{params[:assignee][0]}"
		end
	else
		message = "#{params[:assignee][0]} already added to cart"
	end
    render :json => message.to_json
  end

  private
  def connect_db
    @db = Mysql2::Client.new(:host => '140.112.107.1', :username => 'chuya', :password=> '0514', :database => 'patentproject2012', :encoding => 'utf8')
  end
end