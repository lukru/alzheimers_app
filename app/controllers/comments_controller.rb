class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_tip
  before_filter :verify_ownership, only: [:edit, :destroy, :update]

  # GET /comments
  # GET /comments.json
  def index
    @comments = @tip.comments.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = @tip.comment
  end

  # GET /comments/new
  def new
    @comment = @tip.comments.build
  end

  # GET /comments/1/edit
  def edit

  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @tip.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @tip, notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find_by_id(params[:id])
      if @comment.blank?
        redirect_to tips_path, :alert => "oops. that comment doesn't exist. please try another."
      end
    end

    def set_tip
      if params[:tip_id]
        @tip = Tip.find(params[:tip_id])
      else
        @tip = @comment.tip if @comment.present?
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:author_name, :comment_text, :references, :references)
    end

    def verify_ownership
      if @comment.user != current_user 
        flash[:alert] = "You don't have permission to edit that comment"
        redirect_to tip_path(@comment.tip)
      end
    end

end
