# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120926050553) do

  create_table "examiner_2007", :id => false, :force => true do |t|
    t.string "patent_id",   :limit => 30, :null => false
    t.string "examiner_id", :limit => 30, :null => false
  end

 # create_table "examiner_2007s", :force => true do |t|
 #   t.string   "patent_id"
 #   t.string   "examiner_id"
 #   t.datetime "created_at",  :null => false
 #   t.datetime "updated_at",  :null => false
 # end

  create_table "inventor_2007", :id => false, :force => true do |t|
    t.string "Name",      :limit => 50, :null => false
    t.string "Patent_id", :limit => 10, :null => false
    t.string "Location",  :limit => 50, :null => false
  end

  create_table "ipc", :id => false, :force => true do |t|
    t.string "Patent_id", :limit => 15, :null => false
    t.string "IPC_class", :limit => 25, :null => false
  end

  create_table "patent_2007", :primary_key => "Patent_id", :force => true do |t|
    t.string "Issued_date", :limit => 25
    t.string "Filed_Date",  :limit => 25
    t.text   "Abstract"
    t.text   "Claims"
    t.text   "Description"
    t.text   "Summary"
  end

  create_table "reference_2007", :id => false, :force => true do |t|
    t.string "patent_id",    :limit => 30, :null => false
    t.string "reference_id", :limit => 30, :null => false
  end

end
