class Admin::PetitionsController < Admin::BaseController
  before_action :can_access?

  def publish
    @petition = Petition.find_by_id(params[:petition][:id])
    if @petition.update(petition_params)
      flash[:notice] = 'Петиция опубликована'
      redirect_to petition_path(@petition)
    end
  end

  def reject
    @petition = Petition.find_by_id(params[:petition][:id])
    if @petition.update(petition_params)
      flash[:notice] = 'Петиция отклонена'
      redirect_to petition_path(@petition)
    end
  end

  def show_new
    @new_petitions = Petition.where("state = 'new'")
  end

  private

  def petition_params
    params.require(:petition).permit(:id, :state)
  end
end
