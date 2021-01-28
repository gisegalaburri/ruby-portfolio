class Portfolio < ApplicationRecord
  has_many :technologies
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  # custom scope
  # self. indicates is a class method
  def self.angular
      where(subtitle: 'Angular')
  end

  # another custom scope
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  # callback
  after_initialize :set_defaults

  def set_defaults
    # ||= if the main_image is nil, if it is, set the default image
    # shortcut of: 
    # if main_image == nill 
        # self.main_image ||= "https://via.placeholder.com/600x400" 
    # end
    # self.main_image ||= "https://via.placeholder.com/600x400"
    # self.thumb_image ||= "https://via.placeholder.com/350x200"
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
