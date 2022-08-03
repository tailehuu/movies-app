class Movie < ActiveRecord::Base
  belongs_to :user

  validates :title, :description, :link, :user_id, presence: true
end
