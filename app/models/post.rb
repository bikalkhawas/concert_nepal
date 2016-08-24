class Post < ActiveRecord::Base

	acts_as_votable
	searchkick
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: {minimum: 5}
	validates :date, :time, :location, presence: true
	belongs_to :user
end