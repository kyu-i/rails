class Plan < ApplicationRecord
  belongs_to :user
  has_many :plan_details
end
