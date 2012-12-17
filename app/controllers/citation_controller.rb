class CitationController < ApplicationController
  before_filter :connect_db #, :except =>[:index]
  def showGraph
  	# # cytms_test_code
  	# @test = Array.new
  	# @test = @db.query("select `patent_id` from `patent-referencedby_1976` limit 0, 10").to_a
    # require_relative 'lib/connect_mysql'
    # require 'json'


    # connect = Connect_mysql.new('chuya', '0514')
    # db = connect.db('patentproject2012') 

    queryString = "select patents from carts where `cart_id`='2'"





    temp = @db.query(queryString)
    temp.each do |tt|
      # @a = tt
      @patents = JSON.parse(tt['patents'])
    end





    data = Hash.new

    data['nodes'] = Array.new
    data['links'] = Array.new


    count_n = 0
    count_l = 0

    temp = @db.query(queryString)
    temp.each do |tt|
      # @a = tt
      @patents2 = JSON.parse(tt['patents'])
    end


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


      ((each['issued_year'].to_i)..2007).each do |i|
        temp2 = @db_ref.query("SELECT COUNT(Patent_id)
                               FROM `patent-referencedby_" + each['issued_year'] + "` 
                               WHERE `Patent_id` = '"+ each['patent_id'] +"'")
        temp2.each do |t|
          data['nodes'][count_n]['playcount'] += t['COUNT(Patent_id)']
        end
      end


      # data['nodes'][count_n]['playcount'] = data['nodes'][count_n]['playcount']*100000
      count_n += 1
    end
    # for i in 0..(data['nodes'].size-1)
    #   # if data['nodes'][i]['year'] != nil
    #   #   temp = db.query("SELECT `Title` 
    #   #                  FROM `patent_" + data['nodes'][i]['year'] + "` 
    #   #                  WHERE `Patent_id` = '"+ data['nodes'][i]['id'] +"'")
    #   #   data['nodes'][i]['title'] = temp[0]['Title']
    #   #   temp = db.query("SELECT `Assignee` 
    #   #                  FROM `assignee_" + data['nodes'][i]['year'] + "` 
    #   #                  WHERE `Patent_id` = '"+ data['nodes'][i]['id'] +"'")
    #   #   data['nodes'][i]['assignee'] = temp[0]['Assignee']
    #   # else
    #     (2007..2008).each { |year|
    #       temp = db.query("SELECT `Title` 
    #                      FROM `patent_" + year.to_s + "` 
    #                      WHERE `Patent_id` = '"+ data['nodes'][i]['id'] +"'")
    #       temp.each do |each|
    #         data['nodes'][i]['title'] = each['Title']
    #         temp = db.query("SELECT `Assignee` 
    #                        FROM `assignee_" + year.to_s + "` 
    #                        WHERE `Patent_id` = '"+ data['nodes'][i]['id'] +"'")
    #         temp.each do |each2|
    #           data['nodes'][i]['assignee'] = each2['Assignee']


    #           data['nodes'][i]['artist'] = each2['Assignee']

    #           break
    #         end
    #       end
    #     }
    #   # end
    # end

    # f = File.new("data/test.json", "w")
    # f.write( JSON.pretty_generate(data) )
    # f.close
    render :json => data
  end

  private
  def connect_db
    @db = Mysql2::Client.new(:host => '140.112.107.1', :username => 'chuya', :password=> '0514', :database => 'patentproject2012', :encoding => 'utf8')
    @db_ref = Mysql2::Client.new(:host => '140.112.107.1', :username => 'chuya', :password=> '0514', :database => 'mypaper', :encoding => 'utf8')
  end
end
