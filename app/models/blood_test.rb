# == Schema Information
#
# Table name: blood_tests
#
#  id             :bigint           not null, primary key
#  hba1c          :integer
#  hdl            :integer
#  ldl            :integer
#  summary        :string
#  vitamin_d      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  openai_conv_id :string
#  user_id        :integer
#
class BloodTest < ApplicationRecord
end
