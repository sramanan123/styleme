class UploadImagesController < ApplicationController
  before_action :set_upload_image, only: %i[show edit update destroy]

  def index
    @q = UploadImage.ransack(params[:q])
    @upload_images = @q.result(distinct: true).includes(:image_comments,
                                                        :bookmarks).page(params[:page]).per(10)
  end

  def show
    @bookmark = Bookmark.new
    @image_comment = ImageComment.new
  end

  def new
    @upload_image = UploadImage.new
  end

  def edit; end

  def create
    @upload_image = UploadImage.new(upload_image_params)

    if @upload_image.save
      redirect_to @upload_image,
                  notice: "Upload image was successfully created."
    else
      render :new
    end
  end

  def update
    if @upload_image.update(upload_image_params)
      redirect_to @upload_image,
                  notice: "Upload image was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @upload_image.destroy
    redirect_to upload_images_url,
                notice: "Upload image was successfully destroyed."
  end

  private

  def set_upload_image
    @upload_image = UploadImage.find(params[:id])
  end

  def upload_image_params
    params.require(:upload_image).permit(:image, :topstyle, :topcolor,
                                         :bottomstyle, :bottomcolor, :shoestyle, :shoecolor, :vibe)
  end
end
