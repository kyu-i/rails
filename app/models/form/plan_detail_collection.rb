class Form::PlanDetailCollection < Form::Base
	FORM_COUNT = 2
	attr_accessor :plan_details

	def initialize(attributes = {})
		super attributes
		self.plan_details = FORM_COUNT.times.map { PlanDetail.new() } unless self.plan_details.present?
	end

	def plan_details_attributes=(attributes)
		self.plan_details = attributes.map { |_, v| PlanDetail.new(v) }
	end

	def save
		PlanDetail.transaction do
			self.plan_details.map(&:save!)
		end
			return true
	rescue => e
		return false
	end
end