class Review < ApplicationRecord
  validates :body, presence: true
  belongs_to :user
  belongs_to :item

  def post_date
    created_at.to_formatted_s(:long)
  end
end
