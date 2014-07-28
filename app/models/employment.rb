class Employment < ActiveRecord::Base
  belongs_to :person
  belongs_to :location

  validates :role, presence: true
  validates :location_id, presence: true
end
