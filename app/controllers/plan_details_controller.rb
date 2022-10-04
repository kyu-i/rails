class PlanDetailsController < ApplicationController
    before_action :authenticate_user!

    
    def new    
        @plan = Plan.find params[:id]
        @plan_detail = @plan.plan_details.build
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
        # params.permit(:spot_date,:start_time,:end_time,
        #     :destination,:spot_contmovement).merge(plan_id: params[:id])
            
        # params.require(:plan_detail).permit(:spot_date,:start_time,:end_time,
        #     :destination,:spot_content,:movement, :_destroy).merge(plan_id: params[:id])
        
        
        # params.require(:plan).permit(plan_detail_attributes: [:spot_date,
        #     :destination,:spot_content,:movement, :_destroy]).merge(plan_id: params[:id])
            
        # params.require(:plan).permit(plan_detail: [plan_detail_attributes: [:spot_date,
        #             :destination,:spot_content,:movement, :_destroy]]).merge(plan_id: params[:id])
        
        params.require(:plan).permit(plan_detail: ['0': [plan_detail_attributes: [:spot_date,
                    :destination,:spot_content,:movement, :_destroy]]]).merge(plan_id: params[:id])
        
        end
end
