class RentalsController < ApplicationController
  inherit_resources

  def show
    return redirect_back fallback_location: root_path, flash: { error: "You have to upload first a csv file" } if resource.csv.blank?
    super
  end

  def edit
    return redirect_back fallback_location: root_path, flash: { error: "You can't upload twice for the same travel."} unless resource.csv.blank?
    super
  end

  def update
    update! do |s, f|
      f.html { return redirect_back fallback_location: root_path, flash: { error: "only csv file are allowed" } }
      s.html { redirect_to rentals_path }
    end
  end

  protected
  def collection
    @rentals = Rental.all.order(status: :DESC).order(:id)
  end

  def rental_params
    params.require(:rental).permit(:csv)
  end
end