class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, stretches: 13

  before_create :skip_confirm

  def skip_confirm
    self.skip_confirmation!
  end
end
