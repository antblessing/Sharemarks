class Bookmark < ActiveRecord::Base
  belongs_to :topic
  delegate :user, to: :topic
end
