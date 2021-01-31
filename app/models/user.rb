class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable -> this last alow third party logins for Facebook, Google, etc
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # This validates the name not blank, devise do this with email and pass
  validates_presence_of :name

  # Virtual attributes
  # use split.first and split.last insted of split[0] and split[1]
  # cause if the user enters only one name it will bring an error
  # in that case, with first and last will bring the same string
  def first_name
    # String maniputalation, split method
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end
end
