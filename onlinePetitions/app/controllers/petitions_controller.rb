class PetitionsController < ApplicationController
  def index
    case
      when params[:all]
        @petitions = Petition.all
      when params[:my]
        @petitions = current_user.petitions.all
      else
        @petitions = Petition.take(10)
    end
  end

  def new
    @petition = Petition.new
  end

  def create
    @petition = current_user.petitions.create(petition_params)
    if @petition.save
      redirect_to petition_path(@petition)
    else
      render 'new'
    end
  end

  def edit
    @petition = Petition.find_by_id(params[:id])
    render 'new'
  end

  def update
    @petition = Petition.find_by_id(params[:id])
    if @petition.update(petition_params)
      flash[:notice] = 'Петиция обновлена'
      redirect_to action: 'show', id: @petition.id
    end
  end

  def show
    @petition = Petition.find_by_id(params[:id])
  end

  def destroy
    @petition = Petition.find_by_id(params[:id]).destroy
    flash[:notice] = 'Петиция удалена'
    redirect_to :action => 'index', my: 'true'
  end

  private

  def petition_params
    params.require(:petition).permit(:title, :text, :user_id)
  end

end
