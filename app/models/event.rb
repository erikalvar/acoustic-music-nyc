class Event < ApplicationRecord

  has_many :event_tags
  has_many :tags, through: :event_tags
  belongs_to :user

  # attribute :moderator_id, :integer, default: nil

  validates :title, presence: true, length: { minimum: 5 }
  validates :venue, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :user_id, presence: true


end
                 