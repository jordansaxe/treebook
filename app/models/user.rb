class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :statuses

  def full_name
  	full_name = "#{first_name} #{last_name}"
  	full_name.blank? ? 'Anonymous' : full_name
  end
end
