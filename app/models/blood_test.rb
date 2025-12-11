# == Schema Information
#
# Table name: blood_tests
#
#  id             :bigint           not null, primary key
#  hba1c          :integer
#  hdl            :integer
#  image          :string
#  ldl            :integer
#  pdf            :string
#  summary        :string
#  vitamin_d      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  openai_conv_id :string
#  user_id        :integer
#
class BloodTest < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true

  mount_uploader :pdf, PdfUploader
end
