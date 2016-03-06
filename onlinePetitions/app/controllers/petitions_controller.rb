class PetitionsController < ApplicationController
  def index
    @petitions = Petition.take(10)
  end

  def all
    if params[:my]
      @petitions = current_user.petitions.all
    else
      @petitions = Petition.all
    end
    render "index", petitions: @petitions, my: params[:my]
  end

  def new
    @petition = Petition.new
  end

  def create
    @petition = current_user.petitions.create(petition_params)
    if @petition.save
      redirect_to action: "show", id: @petition.id
    else
      render "new"
    end
  end

  def show
    @petition = Petition.find_by_id(params[:id])
  end

  private

  def petition_params
    params.require(:petition).permit(:title, :text, :user_id)
  end

end
