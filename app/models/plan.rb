class Plan < ApplicationRecord
  belongs_to :user
  has_many :plan_details, dependent: :destroy
  
  accepts_nested_attributes_for :plan_details
end
