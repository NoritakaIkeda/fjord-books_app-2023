# Frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit destroy]
  before_action :ensure_correct_user, only: %i[edit destroy]

  def edit; end

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      @comments = @commentable.comments
      render_commentable_show
    end
  end

  def destroy
    @comment.destroy
    redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
    @commentable = @comment.commentable
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def ensure_correct_user
    redirect_to reports_path, notice: 'You are not authorized to edit this report.' unless @comment.user == current_user
  end
end
