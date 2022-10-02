class PlanDetailsController < ApplicationController
    before_action :authenticate_user!

    
    def new
        @plan = Plan.find params[:plan_id]
        @plan_detail = @plan.plan_details.build
        # if @plan_detail.save
        #     flash[:notice] = "detail save"
        # else 
        #     flash[:notice] = "detail not save"
        # end
    end

    def create
        @plan_detail = PlanDetail.new(plan_detail_params) 
        if @plan_detail.save
            flash[:notice] = "detail save"
        else 
            flash[:notice] = "detail not save"
        end
    end

    private
    def plan_detail_params
        params.permit(:spot_date,:start_time,:end_time,
            :destination,:spot_content,:movement).merge(plan_id: params[:id])
            
        # params.require(:plan).permit(:spot_date,:start_time,:end_time,
        #     :destination,:spot_content,:movement).merge(plan_id: params[:id])
    end
end
