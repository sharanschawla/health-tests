class CreateBloodTests < ActiveRecord::Migration[8.0]
  def change
    create_table :blood_tests do |t|
      t.integer :user_id
      t.integer :vitamin_d
      t.integer :hba1c
      t.integer :hdl
      t.integer :ldl
      t.string :openai_conv_id
      t.string :summary

      t.timestamps
    end
  end
end
