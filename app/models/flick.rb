class Flick < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_attached_file :flick_img, :styles =>  { :flick_index => "300x300>", :flick_show => "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :flick_img, content_type: /\Aimage\/.*\z/
end
