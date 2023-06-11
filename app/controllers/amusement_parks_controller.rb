class AmusementParksController < ApplicationController
  def show
    @ap = AmusementPark.find(params[:id])
    # @mechanics = @ap.all_mechanics(@ap.name)
    # ^original
    @mechanics = @ap.mechanics
    # ^ep: better way and now you don't need the extra all_mechanics method
    # ep: controller could be thinner by calling the mechanics and probably rides in the view with @ap.mechanics
    @rides = @ap.all_rides(@ap.id)
  end
end
