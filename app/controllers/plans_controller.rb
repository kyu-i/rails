class PlansController < ApplicationController
    def index
        @plans = Plan.where(user_id: current_user.id)
        # flash[:notice] = "#{@plans.title}"
    end

    def new        
        @plan_outline = Plan.new() 
    end
    
    def create
        @plan_outline = Plan.new(title: params[:title],
        start_date: params[:start_date],
        end_date: params[:end_date],
        memo: params[:memo]
        )
        @plan_outline.user_id = current_user.id
        if @plan_outline.save!
            flash[:notice] = "plan_outline save"
        else 
            flash[:notice] = "plan_outline not save"
        end
        render("plans/create")
    end
    
    def show
        @plan = Plan.find_by(id: params[:id])
        @plan_detail = PlanDetail.find_by(plan_id: params[:id])
    end


end
