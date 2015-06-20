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

require 'rails_helper'

RSpec.describe Order, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
