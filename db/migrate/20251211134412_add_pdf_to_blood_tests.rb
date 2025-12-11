class AddPdfToBloodTests < ActiveRecord::Migration[8.0]
  def change
    add_column :blood_tests, :pdf, :string
  end
end
