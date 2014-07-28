class EmploymentsController < ApplicationController
  def new
    @person = Person.find(params[:person_id])
    @employment = Employment.new
  end

  def create
    @person = Person.find(params[:person_id])
    employment = @person.employments.new(params.require(:employment).permit(:location_id, :role))
    if employment.save
      redirect_to person_path(@person)
    else
      @person = Person.find(params[:person_id])
      @employment = Employment.new
      @employment.errors[:base] << "Location can't be blank"
      @employment.errors[:base] << "Role can't be blank"
      render :new
    end
  end
end