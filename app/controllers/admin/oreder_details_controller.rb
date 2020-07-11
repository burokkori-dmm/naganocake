class Admin::OrederDetailsController < ApplicationController
  def update
  	oreder_details = OrederDetail.find(params[:id])
  	oreder_details.update(oreder_detail_params)
  	redirect_back(fallback_location: root_path)
  end

  private
	def oreder_detail_params
		params.require(:oreder_detail).permit(:making_status)
	end
end
