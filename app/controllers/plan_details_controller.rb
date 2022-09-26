class PlanDetailsController < ApplicationController
    def new 
        @plan_detail = PlanDetail.new(spot_date: params[:spot_date],
        start_time: params[:start_time],
        end_time: params[:end_time],
        destination: params[:destination],
        spot_content: params[:spot_content],
        movement: params[:movement])
        
        @plan_detail.plan_id = params[:id]

        if @plan_detail.save!
            flash[:notice] = "detail save"
        else 
            flash[:notice] = "detail not save"
        end
    end
end
