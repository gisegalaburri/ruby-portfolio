class Blog < ApplicationRecord
  #every new blog by default will be in draft mode
  enum status: {draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged

  # rollback if some of this atrributes are null
  validates_presence_of :title, :body

  # associate blogs to 1 topic 
  belongs_to :topic, optional: true
end
