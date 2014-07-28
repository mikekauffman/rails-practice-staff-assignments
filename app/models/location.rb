class Location < ActiveRecord::Base

  validates :name, presence: true

  has_many :people, through: :employments
  has_many :employments
end