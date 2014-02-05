class VotesController < ApplicationController
    before_action :set_tip

  # GET /votes/new
  def new
    @vote = @tip.votes.new
  end


  # POST /votes
  # POST /votes.json
  def create
    @vote = @tip.votes.new
    @vote.user = current_user
    @vote.save

    respond_to do |format|
      format.html { redirect_to @vote.tip, notice: 'Vote was successfully created.' }
      format.json { render action: 'show', status: :created, location: @vote }
    end
  end

  private

  def set_tip
    @tip = Tip.find(params[:tip_id])
  end

end
