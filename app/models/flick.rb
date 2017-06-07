class Flick < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_attached_file :flick_img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :flick_img, content_type: /\Aimage\/.*\z/
end
