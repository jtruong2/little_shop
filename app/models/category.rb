class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :items

  def to_param
    name
  end

  def self.find_by_param(input)
    find_by_name(input)
  end
end
