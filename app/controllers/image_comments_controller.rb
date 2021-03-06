class ImageCommentsController < ApplicationController
  before_action :current_user_must_be_image_comment_commentor,
                only: %i[edit update destroy]

  before_action :set_image_comment, only: %i[show edit update destroy]

  def index
    @q = ImageComment.ransack(params[:q])
    @image_comments = @q.result(distinct: true).includes(:commentor,
                                                         :image).page(params[:page]).per(10)
  end

  def show; end

  def new
    @image_comment = ImageComment.new
  end

  def edit; end

  def create
    @image_comment = ImageComment.new(image_comment_params)

    if @image_comment.save
      message = "ImageComment was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @image_comment, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @image_comment.update(image_comment_params)
      redirect_to @image_comment,
                  notice: "Image comment was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @image_comment.destroy
    message = "ImageComment was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to image_comments_url, notice: message
    end
  end

  private

  def current_user_must_be_image_comment_commentor
    set_image_comment
    unless current_user == @image_comment.commentor
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_image_comment
    @image_comment = ImageComment.find(params[:id])
  end

  def image_comment_params
    params.require(:image_comment).permit(:image_id, :comment, :commentor_id)
  end
end
