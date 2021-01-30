class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable -> this last alow third party logins for Facebook, Google, etc
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
