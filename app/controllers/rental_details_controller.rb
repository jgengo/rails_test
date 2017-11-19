class RentalDetailsController < ApplicationController
  inherit_resources
  

  private def collection
    @rental_details = RentalDetail.all.where(rental_id: params[:rental_id])
  end

  # private def permitted_params
  #   params.permit(rental: [:csv])
  # end

  # private def handle_errors(message)
  #   redirect_back fallback_location: root_path, flash: { error: message }
  # end

  # private def historic
  #   @collection = collection.status_done
  #   render 'historics'
  # end
end
