# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  title              :string
#  description        :text
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  price              :decimal(, )
#  items_available    :integer
#  available_until    :date
#  user_id            :integer
#

require 'rails_helper'

RSpec.describe Product, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
