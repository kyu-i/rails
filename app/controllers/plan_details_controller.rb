class PlanDetailsController < ApplicationController
    before_action :authenticate_user!

    
    def new    
        @plan = Plan.find params[:id]
        @plan_detail_form = Form::PlanDetailCollection.new
    end

    def create
        @plan = Plan.find params[:id]
        @plan_detail_form = Form::PlanDetailCollection.new(plan_details_collection_params)
        if @plan_detail_form.save
            redirect_to root_path, notice: "保存しました。"
        else
            render :new
        end
    end

    private
    def plan_details_collection_params
        params.require(:form_plan_detail_collection).permit(plan_details_attributes: [:destination, :start_time, :plan_id])
    end
end
