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

ActiveRecord::Schema.define(:version => 20121211165428) do

  create_table "abbr_demo", :id => false, :force => true do |t|
    t.string "abbreviation", :limit => 15,  :null => false
    t.string "name",         :limit => 100, :null => false
  end

  create_table "abbreviations", :id => false, :force => true do |t|
    t.string "abbreviation", :limit => 15,  :null => false
    t.string "name",         :limit => 100, :null => false
  end

  create_table "assignee_2003", :id => false, :force => true do |t|
    t.text "Patent_id", :limit => 255,      :null => false
    t.text "Assignee",  :limit => 16777215, :null => false
    t.text "Location",  :limit => 16777215, :null => false
  end

  add_index "assignee_2003", ["Assignee"], :name => "assignee", :length => {"Assignee"=>200}
  add_index "assignee_2003", ["Patent_id"], :name => "patent_id", :length => {"Patent_id"=>7}

  create_table "assignee_2004", :id => false, :force => true do |t|
    t.text "Patent_id", :limit => 255,      :null => false
    t.text "Assignee",  :limit => 16777215, :null => false
    t.text "Location",  :limit => 16777215, :null => false
  end

  add_index "assignee_2004", ["Assignee"], :name => "assignee", :length => {"Assignee"=>200}
  add_index "assignee_2004", ["Patent_id"], :name => "patent_id", :length => {"Patent_id"=>7}

  create_table "assignee_2005", :id => false, :force => true do |t|
    t.text "Patent_id", :limit => 255,      :null => false
    t.text "Assignee",  :limit => 16777215, :null => false
    t.text "Location",  :limit => 16777215, :null => false
  end

  add_index "assignee_2005", ["Assignee"], :name => "assignee", :length => {"Assignee"=>200}
  add_index "assignee_2005", ["Patent_id"], :name => "patent_id", :length => {"Patent_id"=>7}

  create_table "assignee_2006", :id => false, :force => true do |t|
    t.text "Patent_id", :limit => 255,      :null => false
    t.text "Assignee",  :limit => 16777215, :null => false
    t.text "Location",  :limit => 16777215, :null => false
  end

  add_index "assignee_2006", ["Assignee"], :name => "assignee", :length => {"Assignee"=>200}
  add_index "assignee_2006", ["Patent_id"], :name => "patent_id", :length => {"Patent_id"=>7}

  create_table "assignee_2007", :id => false, :force => true do |t|
    t.text "Patent_id", :limit => 255,      :null => false
    t.text "Assignee",  :limit => 16777215, :null => false
    t.text "Location",  :limit => 16777215, :null => false
  end

  add_index "assignee_2007", ["Assignee"], :name => "assignee", :length => {"Assignee"=>200}
  add_index "assignee_2007", ["Patent_id"], :name => "patent_id", :length => {"Patent_id"=>7}

  create_table "assignee_2008", :id => false, :force => true do |t|
    t.text "Patent_id", :limit => 255,      :null => false
    t.text "Assignee",  :limit => 16777215, :null => false
    t.text "Location",  :limit => 16777215, :null => false
  end

  create_table "carts", :force => true do |t|
    t.string   "patent_id"
    t.integer  "user"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "examiner_2007", :id => false, :force => true do |t|
    t.string "patent_id",   :limit => 30, :null => false
    t.string "examiner_id", :limit => 30, :null => false
  end

  create_table "examiner_2008", :id => false, :force => true do |t|
    t.string "patent_id",   :limit => 30, :null => false
    t.string "examiner_id", :limit => 30, :null => false
  end

  create_table "inventor_2000", :id => false, :force => true do |t|
    t.string "Name",      :limit => 50, :null => false
    t.string "Patent_id", :limit => 10, :null => false
    t.string "Location",  :limit => 50, :null => false
  end

  add_index "inventor_2000", ["Patent_id"], :name => "patent_id", :length => {"Patent_id"=>7}

  create_table "inventor_2001", :id => false, :force => true do |t|
    t.string "Name",      :limit => 50, :null => false
    t.string "Patent_id", :limit => 10, :null => false
    t.string "Location",  :limit => 50, :null => false
  end

  add_index "inventor_2001", ["Patent_id"], :name => "patent_id", :length => {"Patent_id"=>7}

  create_table "inventor_2002", :id => false, :force => true do |t|
    t.string "Name",      :limit => 50, :null => false
    t.string "Patent_id", :limit => 10, :null => false
    t.string "Location",  :limit => 50, :null => false
  end

  add_index "inventor_2002", ["Patent_id"], :name => "patent_id", :length => {"Patent_id"=>7}

  create_table "inventor_2003", :id => false, :force => true do |t|
    t.string "Name",      :limit => 50, :null => false
    t.string "Patent_id", :limit => 10, :null => false
    t.string "Location",  :limit => 50, :null => false
  end

  add_index "inventor_2003", ["Patent_id"], :name => "patent_id", :length => {"Patent_id"=>7}

  create_table "inventor_2004", :id => false, :force => true do |t|
    t.string "Name",      :limit => 50, :null => false
    t.string "Patent_id", :limit => 10, :null => false
    t.string "Location",  :limit => 50, :null => false
  end

  add_index "inventor_2004", ["Patent_id"], :name => "patent_id", :length => {"Patent_id"=>7}

  create_table "inventor_2005", :id => false, :force => true do |t|
    t.string "Name",      :limit => 50, :null => false
    t.string "Patent_id", :limit => 10, :null => false
    t.string "Location",  :limit => 50, :null => false
  end

  add_index "inventor_2005", ["Patent_id"], :name => "patent_id", :length => {"Patent_id"=>7}

  create_table "inventor_2006", :id => false, :force => true do |t|
    t.string "Name",      :limit => 50, :null => false
    t.string "Patent_id", :limit => 10, :null => false
    t.string "Location",  :limit => 50, :null => false
  end

  add_index "inventor_2006", ["Patent_id"], :name => "patent_id", :length => {"Patent_id"=>7}

  create_table "inventor_2007", :id => false, :force => true do |t|
    t.string "Name",      :limit => 50, :null => false
    t.string "Patent_id", :limit => 10, :null => false
    t.string "Location",  :limit => 50, :null => false
  end

  add_index "inventor_2007", ["Patent_id"], :name => "patent_id", :length => {"Patent_id"=>7}

  create_table "inventor_2008", :id => false, :force => true do |t|
    t.string "Name",      :limit => 50, :null => false
    t.string "Patent_id", :limit => 50, :null => false
    t.string "Location",  :limit => 50, :null => false
  end

  create_table "ipc_1990", :id => false, :force => true do |t|
    t.string "Patent_id", :limit => 15, :null => false
    t.string "IPC_class", :limit => 25, :null => false
  end

  create_table "ipc_1991", :id => false, :force => true do |t|
    t.string "Patent_id", :limit => 15, :null => false
    t.string "IPC_class", :limit => 25, :null => false
  end

  create_table "ipc_1992", :id => false, :force => true do |t|
    t.string "Patent_id", :limit => 15, :null => false
    t.string "IPC_class", :limit => 25, :null => false
  end

  create_table "ipc_1993", :id => false, :force => true do |t|
    t.string "Patent_id", :limit => 15, :null => false
    t.string "IPC_class", :limit => 25, :null => false
  end

  create_table "ipc_1994", :id => false, :force => true do |t|
    t.string "Patent_id", :limit => 15, :null => false
    t.string "IPC_class", :limit => 25, :null => false
  end

  create_table "ipc_1995", :id => false, :force => true do |t|
    t.string "Patent_id", :limit => 15, :null => false
    t.string "IPC_class", :limit => 25, :null => false
  end

  create_table "ipc_1996", :id => false, :force => true do |t|
    t.string "Patent_id", :limit => 15, :null => false
    t.string "IPC_class", :limit => 25, :null => false
  end

  create_table "ipc_1997", :id => false, :force => true do |t|
    t.string "Patent_id", :limit => 15, :null => false
    t.string "IPC_class", :limit => 25, :null => false
  end

  create_table "ipc_1998", :id => false, :force => true do |t|
    t.string "Patent_id", :limit => 15, :null => false
    t.string "IPC_class", :limit => 25, :null => false
  end

  create_table "ipc_1999", :id => false, :force => true do |t|
    t.string "Patent_id", :limit => 15, :null => false
    t.string "IPC_class", :limit => 25, :null => false
  end

  create_table "ipc_2000", :id => false, :force => true do |t|
    t.string "Patent_id", :limit => 15, :null => false
    t.string "IPC_class", :limit => 25, :null => false
  end

  create_table "ipc_2001", :id => false, :force => true do |t|
    t.string "Patent_id", :limit => 15, :null => false
    t.string "IPC_class", :limit => 25, :null => false
  end

  create_table "ipc_2002", :id => false, :force => true do |t|
    t.string "Patent_id", :limit => 15, :null => false
    t.string "IPC_class", :limit => 25, :null => false
  end

  create_table "ipc_2003", :id => false, :force => true do |t|
    t.string "Patent_id", :limit => 15, :null => false
    t.string "IPC_class", :limit => 25, :null => false
  end

  create_table "ipc_2004", :id => false, :force => true do |t|
    t.string "Patent_id", :limit => 15, :null => false
    t.string "IPC_class", :limit => 25, :null => false
  end

  create_table "ipc_2005", :id => false, :force => true do |t|
    t.string "Patent_id", :limit => 15, :null => false
    t.string "IPC_class", :limit => 25, :null => false
  end

  add_index "ipc_2005", ["Patent_id"], :name => "patent_id"

  create_table "ipc_2006", :id => false, :force => true do |t|
    t.string "Patent_id", :limit => 15, :null => false
    t.string "IPC_class", :limit => 25, :null => false
  end

  add_index "ipc_2006", ["Patent_id"], :name => "patent_id"

  create_table "ipc_2007", :id => false, :force => true do |t|
    t.string "Patent_id", :limit => 15, :null => false
    t.string "IPC_class", :limit => 25, :null => false
  end

  add_index "ipc_2007", ["Patent_id"], :name => "patent_id"

  create_table "ipc_2008", :id => false, :force => true do |t|
    t.string "Patent_id", :limit => 15, :null => false
    t.string "IPC_class", :limit => 25, :null => false
  end

  create_table "models", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "models", ["email"], :name => "index_models_on_email", :unique => true
  add_index "models", ["reset_password_token"], :name => "index_models_on_reset_password_token", :unique => true

  create_table "patent_1990", :primary_key => "Patent_id", :force => true do |t|
    t.string "Issued_date", :limit => 25
    t.string "Filed_Date",  :limit => 25
    t.text   "Title"
    t.text   "Abstract"
    t.text   "Claims"
    t.text   "Description"
    t.text   "Summary"
  end

  create_table "patent_1991", :primary_key => "Patent_id", :force => true do |t|
    t.string "Issued_date", :limit => 25
    t.string "Filed_Date",  :limit => 25
    t.text   "Title"
    t.text   "Abstract"
    t.text   "Claims"
    t.text   "Description"
    t.text   "Summary"
  end

  create_table "patent_1992", :primary_key => "Patent_id", :force => true do |t|
    t.string "Issued_date", :limit => 25
    t.string "Filed_Date",  :limit => 25
    t.text   "Title"
    t.text   "Abstract"
    t.text   "Claims"
    t.text   "Description"
    t.text   "Summary"
  end

  create_table "patent_1993", :primary_key => "Patent_id", :force => true do |t|
    t.string "Issued_date", :limit => 25
    t.string "Filed_Date",  :limit => 25
    t.text   "Title"
    t.text   "Abstract"
    t.text   "Claims"
    t.text   "Description"
    t.text   "Summary"
  end

  create_table "patent_1994", :primary_key => "Patent_id", :force => true do |t|
    t.string "Issued_date", :limit => 25
    t.string "Filed_Date",  :limit => 25
    t.text   "Title"
    t.text   "Abstract"
    t.text   "Claims"
    t.text   "Description"
    t.text   "Summary"
  end

  create_table "patent_1995", :primary_key => "Patent_id", :force => true do |t|
    t.string "Issued_date", :limit => 25
    t.string "Filed_Date",  :limit => 25
    t.text   "Title"
    t.text   "Abstract"
    t.text   "Claims"
    t.text   "Description"
    t.text   "Summary"
  end

  create_table "patent_1996", :primary_key => "Patent_id", :force => true do |t|
    t.string "Issued_date", :limit => 25
    t.string "Filed_Date",  :limit => 25
    t.text   "Title"
    t.text   "Abstract"
    t.text   "Claims"
    t.text   "Description"
    t.text   "Summary"
  end

  create_table "patent_1997", :primary_key => "Patent_id", :force => true do |t|
    t.string "Issued_date", :limit => 25
    t.string "Filed_Date",  :limit => 25
    t.text   "Title"
    t.text   "Abstract"
    t.text   "Claims"
    t.text   "Description"
    t.text   "Summary"
  end

  create_table "patent_1998", :primary_key => "Patent_id", :force => true do |t|
    t.string "Issued_date", :limit => 25
    t.string "Filed_Date",  :limit => 25
    t.text   "Title"
    t.text   "Abstract"
    t.text   "Claims"
    t.text   "Description"
    t.text   "Summary"
  end

  create_table "patent_1999", :primary_key => "Patent_id", :force => true do |t|
    t.string "Issued_date", :limit => 25
    t.string "Filed_Date",  :limit => 25
    t.text   "Title"
    t.text   "Abstract"
    t.text   "Claims"
    t.text   "Description"
    t.text   "Summary"
  end

  create_table "patent_2000", :primary_key => "Patent_id", :force => true do |t|
    t.string "Issued_date", :limit => 25
    t.string "Filed_Date",  :limit => 25
    t.text   "Title"
    t.text   "Abstract"
    t.text   "Claims"
    t.text   "Description"
    t.text   "Summary"
  end

  create_table "patent_2001", :primary_key => "Patent_id", :force => true do |t|
    t.string "Issued_date", :limit => 25
    t.string "Filed_Date",  :limit => 25
    t.text   "Title"
    t.text   "Abstract"
    t.text   "Claims"
    t.text   "Description"
    t.text   "Summary"
  end

  create_table "patent_2002", :primary_key => "Patent_id", :force => true do |t|
    t.string "Issued_date", :limit => 25
    t.string "Filed_Date",  :limit => 25
    t.text   "Title"
    t.text   "Abstract"
    t.text   "Claims"
    t.text   "Description"
    t.text   "Summary"
  end

  create_table "patent_2003", :primary_key => "Patent_id", :force => true do |t|
    t.string "Issued_date", :limit => 25
    t.string "Filed_Date",  :limit => 25
    t.text   "Title"
    t.text   "Abstract"
    t.text   "Claims"
    t.text   "Description"
    t.text   "Summary"
  end

  create_table "patent_2004", :primary_key => "Patent_id", :force => true do |t|
    t.string "Issued_date", :limit => 25
    t.string "Filed_Date",  :limit => 25
    t.text   "Title"
    t.text   "Abstract"
    t.text   "Claims"
    t.text   "Description"
    t.text   "Summary"
  end

  create_table "patent_2005", :primary_key => "Patent_id", :force => true do |t|
    t.string "Issued_date", :limit => 25
    t.string "Filed_Date",  :limit => 25
    t.text   "Title"
    t.text   "Abstract"
    t.text   "Claims"
    t.text   "Description"
    t.text   "Summary"
  end

  create_table "patent_2006", :primary_key => "Patent_id", :force => true do |t|
    t.string "Issued_date", :limit => 25
    t.string "Filed_Date",  :limit => 25
    t.text   "Title",                     :null => false
    t.text   "Abstract"
    t.text   "Claims"
    t.text   "Description"
    t.text   "Summary"
  end

  create_table "patent_2007", :primary_key => "Patent_id", :force => true do |t|
    t.string "Issued_date", :limit => 25
    t.string "Filed_Date",  :limit => 25
    t.text   "Title"
    t.text   "Abstract"
    t.text   "Claims"
    t.text   "Description"
    t.text   "Summary"
  end

  create_table "patent_2008", :primary_key => "Patent_id", :force => true do |t|
    t.string "Issued_date", :limit => 25
    t.string "Filed_Date",  :limit => 25
    t.text   "Title"
    t.text   "Abstract"
    t.text   "Claims"
    t.text   "Description"
    t.text   "Summary"
  end

  create_table "patent_2009", :primary_key => "Patent_id", :force => true do |t|
    t.string "Issued_date", :limit => 25
    t.string "Filed_Date",  :limit => 25
    t.text   "Title"
    t.text   "Abstract"
    t.text   "Claims"
    t.text   "Description"
    t.text   "Summary"
  end

  create_table "reference_2007", :id => false, :force => true do |t|
    t.string "patent_id",    :limit => 30, :null => false
    t.string "reference_id", :limit => 30, :null => false
  end

  create_table "reference_2008", :id => false, :force => true do |t|
    t.string "patent_id",    :limit => 30, :null => false
    t.string "reference_id", :limit => 30, :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "uspc_1990", :id => false, :force => true do |t|
    t.string "Patent_id",  :limit => 15,                 :null => false
    t.string "USPC_class", :limit => 25, :default => "", :null => false
  end

  create_table "uspc_1991", :id => false, :force => true do |t|
    t.string "Patent_id",  :limit => 15,                 :null => false
    t.string "USPC_class", :limit => 25, :default => "", :null => false
  end

  create_table "uspc_1992", :id => false, :force => true do |t|
    t.string "Patent_id",  :limit => 15,                 :null => false
    t.string "USPC_class", :limit => 25, :default => "", :null => false
  end

  create_table "uspc_1993", :id => false, :force => true do |t|
    t.string "Patent_id",  :limit => 15,                 :null => false
    t.string "USPC_class", :limit => 25, :default => "", :null => false
  end

  create_table "uspc_1994", :id => false, :force => true do |t|
    t.string "Patent_id",  :limit => 15,                 :null => false
    t.string "USPC_class", :limit => 25, :default => "", :null => false
  end

  create_table "uspc_1995", :id => false, :force => true do |t|
    t.string "Patent_id",  :limit => 15,                 :null => false
    t.string "USPC_class", :limit => 25, :default => "", :null => false
  end

  create_table "uspc_1996", :id => false, :force => true do |t|
    t.string "Patent_id",  :limit => 15,                 :null => false
    t.string "USPC_class", :limit => 25, :default => "", :null => false
  end

  create_table "uspc_1997", :id => false, :force => true do |t|
    t.string "Patent_id",  :limit => 15,                 :null => false
    t.string "USPC_class", :limit => 25, :default => "", :null => false
  end

  create_table "uspc_1998", :id => false, :force => true do |t|
    t.string "Patent_id",  :limit => 15,                 :null => false
    t.string "USPC_class", :limit => 25, :default => "", :null => false
  end

  create_table "uspc_1999", :id => false, :force => true do |t|
    t.string "Patent_id",  :limit => 15,                 :null => false
    t.string "USPC_class", :limit => 25, :default => "", :null => false
  end

  create_table "uspc_2000", :id => false, :force => true do |t|
    t.string "Patent_id",  :limit => 15,                 :null => false
    t.string "USPC_class", :limit => 25, :default => "", :null => false
  end

  create_table "uspc_2001", :id => false, :force => true do |t|
    t.string "Patent_id",  :limit => 15,                 :null => false
    t.string "USPC_class", :limit => 25, :default => "", :null => false
  end

  create_table "uspc_2002", :id => false, :force => true do |t|
    t.string "Patent_id",  :limit => 15,                 :null => false
    t.string "USPC_class", :limit => 25, :default => "", :null => false
  end

  create_table "uspc_2003", :id => false, :force => true do |t|
    t.string "Patent_id",  :limit => 15,                 :null => false
    t.string "USPC_class", :limit => 25, :default => "", :null => false
  end

  create_table "uspc_2004", :id => false, :force => true do |t|
    t.string "Patent_id",  :limit => 15,                 :null => false
    t.string "USPC_class", :limit => 25, :default => "", :null => false
  end

  create_table "uspc_2005", :id => false, :force => true do |t|
    t.string "Patent_id",  :limit => 15,                 :null => false
    t.string "USPC_class", :limit => 25, :default => "", :null => false
  end

  create_table "uspc_2006", :id => false, :force => true do |t|
    t.string "Patent_id",  :limit => 15,                 :null => false
    t.string "USPC_class", :limit => 25, :default => "", :null => false
  end

  create_table "uspc_2007", :id => false, :force => true do |t|
    t.string "Patent_id",  :limit => 15,                 :null => false
    t.string "USPC_class", :limit => 25, :default => "", :null => false
  end

  create_table "uspc_2008", :id => false, :force => true do |t|
    t.string "Patent_id",  :limit => 15,                 :null => false
    t.string "USPC_class", :limit => 25, :default => "", :null => false
  end

end
