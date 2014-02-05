class TipsController < ApplicationController
  before_action :set_user, except: [:show]
  before_action :set_tip, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  # GET /tips
  # GET /tips.json
  def index
    @tips = Tip.by_votes
    if @user.present? && params[:all].blank?
      @tips = @tips.where(:user_id => @user.id)
    end
    

  end

  # GET /tips/1
  # GET /tips/1.json
  def show
    @tip = Tip.find_by_id(params[:id])
    @user = @tip.user
    @comments = @tip.comments
    @comment = @tip.comments.new
  end

  # GET /tips/new
  def new
    @tip = @user.tips.new
  end

  # GET /tips/1/edit
  def edit
  end

  # POST /tips
  # POST /tips.json
  def create
    @tip = @user.tips.new(tip_params)

    respond_to do |format|
      if @tip.save
        format.html { redirect_to @tip, notice: 'Tip was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tip }
      else
        format.html { render action: 'new' }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tips/1
  # PATCH/PUT /tips/1.json
  def update
    respond_to do |format|
      if @tip.update(tip_params)
        format.html { redirect_to @tip, notice: 'Tip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tips/1
  # DELETE /tips/1.json
  def destroy
    @tip.destroy
    respond_to do |format|
      format.html { redirect_to tips_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tip
      @tip = @user.tips.find_by_id(params[:id])
      if @tip.blank?
        redirect_to tips_path, :alert => "Sorry, you aren't authorized to edit that tip. Choose one of your own!"
      end
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tip_params
      params.require(:tip).permit(:name, :activity_type, :description, :references, :user_id)
    end
end
