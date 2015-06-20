# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  user_id    :integer
#  product_id :integer
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :order do
    quantity ""
created_at ""
user_id ""
product_id 1
  end

end
