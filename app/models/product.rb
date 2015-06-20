class Product < ActiveRecord::Base
  has_attached_file :image,
    styles: { medium: "300x300>", thumb: "100x100>" },
    :default_url => "missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
  has_many :orders

  def progress
    items_available ? orders.count / items_available : 70
  end

  def days_to_go
    available_until ? (available_until - Date.today).to_e : 8
  end
end

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
#
