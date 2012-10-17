class CreateExaminer2007s < ActiveRecord::Migration
  def change
    create_table :examiner_2007s do |t|
      t.string :patent_id
      t.string :examiner_id

      t.timestamps
    end
  end
end
