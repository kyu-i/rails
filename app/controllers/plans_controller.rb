class PlansController < ApplicationController
    before_action :authenticate_user!
    def index
        @plans = Plan.where(user_id: current_user.id)
    end

    def new        
        @plan = Plan.new() 
    end

    
    def create
        @plan = Plan.new(plan_params)
        if @plan.save
            flash[:notice] = "plan save"
        else 
            flash[:notice] = "plan not save"
        end
        render("plans/create")
    end
    
    def show
        @plan = Plan.find_by(id: params[:id])
        @plan_detail = PlanDetail.find_by(plan_id: params[:id])
    end

    private
        def plan_params
            params.permit(:title,:start_date,:end_date,:memo).merge(user_id: current_user.id)
        end

end
