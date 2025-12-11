class AddImageToBloodTests < ActiveRecord::Migration[8.0]
  def change
    add_column :blood_tests, :image, :string
  end
end
