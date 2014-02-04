class PagesController < ApplicationController
  before_action :set_tip
  def about
  end

  def contact
  end

  def welcome
    def index
    end


    def show
      @tips = @user.tips
    end
  end

  private

  def set_tip
    if params[:tip_id].present?
      @tip = Tip.find_by_id(params[:tip_id])
    else
      @tip = @user.tip if @user.present?
    end
  end
end
