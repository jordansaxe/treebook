class Status < ActiveRecord::Base
	validates :user, presence: true
	validates :user_id, presence: true
	validates :content, presence: true, length: { minimum: 2 }
	validates :user_id, presence: true
	belongs_to :user
end
