class Blog < ApplicationRecord
  #every new blog by default will be in draft mode
  enum status: {draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged
end
