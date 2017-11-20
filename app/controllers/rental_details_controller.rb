class RentalDetailsController < ApplicationController
  inherit_resources
  
  private def collection
    @rental_details = RentalDetail.all.where(rental_id: params[:rental_id])
  end
end
