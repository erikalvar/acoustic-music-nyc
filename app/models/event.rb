class Event < ApplicationRecord

  has_many :event_tags
  has_many :tags, through: :event_tags
  belongs_to :user

end
