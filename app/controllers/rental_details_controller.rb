class RentalDetailsController < ApplicationController
  inherit_resources
  
  private def collection
    RentalDetail.all.where(rental_id: params[:rental_id])
  end
end
