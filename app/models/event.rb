class Event < ActiveRecord::Base
  belongs_to :user
  has_many :joins, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :name, :city, :state, :user_id, presence: true
  # validates :date, date: { after: Proc.new { Time.now } }
end