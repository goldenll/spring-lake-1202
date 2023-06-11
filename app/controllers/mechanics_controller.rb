class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
    # @rides = @mechanic.all_rides(@mechanic.name)
    # ^original
    @rides = @mechanic.rides
    # ^ep: better way and now you don't need the extra all_mechanics method
    # ep: @mechanic.rides should be called in view and that would make the controller thinner bc we don't need line 6 anymore
  end

  def create
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find(params[:add_ride])
    RideMechanic.create!(ride: ride, mechanic: mechanic)
    redirect_to "/mechanics/#{mechanic.id}"
  end
  # ^ ep: MVC infraction!
  # when we see a create actio in the mechanics controller, we would assumed we are creating a new mechanic
  # but here we are actually creating a new relationship between an existing ride and an existing mechanic
  # more restful and more in line with MVC protocol to create a RideMechanics controller and route and move this create action there
end

# cover more than just the happiest of happy paths