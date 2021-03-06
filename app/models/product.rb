class Product < ActiveRecord::Base
  has_attached_file :image,
    styles: { medium: "300x300>", thumb: "100x100>" },
    :default_url => "missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :orders
  has_many :comments
  geocoded_by :address
  after_validation :geocode

  def self.text_search(query)
    if query.present?
      where("title ilike :q or description ilike :q", q: "%#{query}%")
    else
      scoped
    end
  end

  def progress
    items_available ? (orders.count.to_f / items_available * 100).to_i : 70
  end

  def days_to_go
    available_until ? (available_until - Date.today).to_i : 8
  end

  def comments_json
    comments.order("created_at DESC").map do |comment|
      {
        id: comment.id,
        body: comment.body,
        user: {
          gravatar_url: comment.user.gravatar_url,
          name: "#{owner.first_name} #{owner.last_name}",
        },
      }
    end
  end

  def pusher_channel
    "product-#{id}"
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
#  price              :decimal(, )
#  items_available    :integer
#  available_until    :date
#  user_id            :integer
#
