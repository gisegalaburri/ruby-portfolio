class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image

    # custom scope
    # self. indicates is a class method
    def self.angular
        where(subtitle: 'Angular')
    end

    # another custom scope
    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
end
