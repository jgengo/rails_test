class RentalsController < ApplicationController
  inherit_resources
  before_action :historic, only: [:index], if: -> { params[:done] }
  before_action -> { handle_errors('You have to upload first a csv file') }, only: [:show], if: -> { resource.csv.blank? }
  before_action -> { handle_errors('You can\'t upload twice for the same travel.') }, only: [:edit], unless: -> { resource.csv.blank? }

  def update
    update! do |s, f|
      f.html { return redirect_back fallback_location: root_path, flash: { error: 'only csv file are allowed' } }
      s.html { redirect_to rentals_path(done: true) }
    end
  end

  private def collection
    @rentals = Rental.all.order(status: :DESC).order(:id).page(params[:page]).per(20)
  end

  private def permitted_params
    params.permit(rental: [:csv])
  end

  private def handle_errors message
    return redirect_back fallback_location: root_path, flash: { error: message }
  end

  private def historic
      @collection = collection.status_done
      return render 'historics'
  end
end