class Person < ActiveRecord::Base

validates :last_name, presence: true
validates :title, presence: true, if: "first_name==''"
validates :first_name, presence: true, if: "title==''"

  has_many :locations, through: :employments
  has_many :employments

end