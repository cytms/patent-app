class CitationController < ApplicationController
  before_filter :connect_db #, :except =>[:index]
  def showGraph
    
    data = Hash.new
    if current_user.nil? == true then
      render :json => data
    end

    queryString = "select patents from carts where `user_id`='#{current_user.id}'"
    # queryString = "select patents from carts where `user_id`='2'"
    temp = @db.query(queryString).to_a.first


# @a = "nooooo"
    if temp.nil? == false then
# @a = "false"
      # temp.each do |tt|
        # @a = tt
      @patents = JSON.parse(temp['patents'])
      # end

      
      data['nodes'] = Array.new
      data['links'] = Array.new

      count_n = 0
      count_l = 0

      # temp = @db.query(queryString)
      # temp.each do |tt|
      #   # @a = tt
      #   @patents2 = JSON.parse(tt['patents'])
      # end
      temp = @db.query(queryString).to_a.first
      @patents2 = JSON.parse(temp['patents'])

      @patents.each do |each|
        # pid = each['patent_id']
        
        data['nodes'][count_n] = Hash.new
        data['nodes'][count_n]['id'] = each['patent_id']

        data['nodes'][count_n]['name'] = each['title']
        # data['nodes'][count_n]['playcount'] = 5000000+count_n*300000
        data['nodes'][count_n]['playcount'] = 0
        data['nodes'][count_n]['artist'] = each['assignee']
        data['nodes'][count_n]['title'] = each['title']
        
            temp = @db_ref.query("SELECT `Patent_id`, `Referenced_By`
                       FROM `patent-referencedby_" + each['issued_year'] + "` 
                       WHERE `Referenced_By` = '"+ each['patent_id'] +"'")
            temp.each do |ref_each|
              # data['nodes'][count_n]['playcount'] += 1
              @patents2.each do |ppid|
                if ref_each['Patent_id'] == ppid['patent_id'] then
                  data['links'][count_l] = Hash.new
                  data['links'][count_l]['source'] = ref_each['Patent_id']  #be referenced
                  data['links'][count_l]['target'] = each['patent_id']  #referenced by
                  count_l += 1
                  # break
                end
              end
            end


        ((each['issued_year'].to_i)..2010).each do |i|
          temp2 = @db_ref.query("SELECT COUNT(Patent_id)
                                 FROM `patent-referencedby_" + each['issued_year'] + "` 
                                 WHERE `Patent_id` = '"+ each['patent_id'] +"'").to_a.first
          # temp2.each do |t|
            data['nodes'][count_n]['playcount'] += temp2['COUNT(Patent_id)']
          # end
        end

        count_n += 1
      end
      
    # else
# @a = "true"
    end
    render :json => data
    # render :text => current_user.id 
  end

  private
  def connect_db
    @db = Mysql2::Client.new(:host => '140.112.107.1', :username => 'chuya', :password=> '0514', :database => 'patentproject2012', :encoding => 'utf8')
    @db_ref = Mysql2::Client.new(:host => '140.112.107.1', :username => 'chuya', :password=> '0514', :database => 'mypaper', :encoding => 'utf8')
  end
end
