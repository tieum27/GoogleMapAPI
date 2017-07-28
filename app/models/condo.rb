require 'textacular'

ActiveRecord::Base.extend(Textacular)

class Condo < ApplicationRecord
  belongs_to :user
  # Check if there is a picture attached to the creation of the new condo
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

  # Validate the file attachement (format and size) to be within parameters
  validates_attachment :image, presence: true,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    size: { in: 0..10.megabytes }

  validates :user, presence: true

  resourcify
end
