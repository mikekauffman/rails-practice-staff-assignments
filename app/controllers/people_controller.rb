class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(params.require(:person).permit(:first_name, :last_name, :title))
    if @person.save
      redirect_to root_path, notice: "Person was created!"
    else
      render :new
    end
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(allowed_params)
      redirect_to person_path(@person)
    else
      @person = Person.find(params[:id])
      @person.errors[:base] << "You must enter a title / last name, or a first name/ last name."
      render :edit
    end

  end

  private

  def allowed_params
    params.require(:person).permit(:first_name, :last_name, :title)
  end

end