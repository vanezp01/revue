class Review < ApplicationRecord
  belongs_to :flick
  belongs_to :user
end
