require_relative 'comment_me_base_controller'

class CommentsController < CommentMeBaseController
  before_action :set_commet, only: %i(show update destroy)

  def show
    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.valid?
      @comment.save

      render json: @comment
    else
      render_comment_errors
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render_comment_errors
    end
  end

  def destroy
    @comment.destroy
  end

  private

  def set_commet
    @comment = Comment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  def comment_params
    params.require(:comment).permit(
      :entity_type,
      :entity_id,
      :emitter,
      :message,
      comments_attributes: [:emitter, :message]
    )
  end

  def render_comment_errors
    render json: @comment.errors, status: :unprocessable_entity
  end
end