class Bookmark < ActiveRecord::Base
  belongs_to :topic
<<<<<<< HEAD
  has_many :likes, dependent: :destroy
=======
  delegate :user, to: :topic
>>>>>>> master
end
