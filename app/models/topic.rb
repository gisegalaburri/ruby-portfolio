class Topic < ApplicationRecord
    validates_presence_of :title

    # references a topic has many blogs
    has_many :blogs
end
