class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def promote
    @vote = current_user.votes.create(vote_params)
    if @vote.save
      flash[:notice] = 'Вы поддержали данную петицию'
      redirect_to petition_path(vote_params[:petition_id])
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:petition_id)
  end
end
