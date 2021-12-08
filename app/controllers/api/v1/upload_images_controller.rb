class Api::V1::UploadImagesController < Api::V1::GraphitiController
  def index
    upload_images = UploadImageResource.all(params)
    respond_with(upload_images)
  end

  def show
    upload_image = UploadImageResource.find(params)
    respond_with(upload_image)
  end

  def create
    upload_image = UploadImageResource.build(params)

    if upload_image.save
      render jsonapi: upload_image, status: 201
    else
      render jsonapi_errors: upload_image
    end
  end

  def update
    upload_image = UploadImageResource.find(params)

    if upload_image.update_attributes
      render jsonapi: upload_image
    else
      render jsonapi_errors: upload_image
    end
  end

  def destroy
    upload_image = UploadImageResource.find(params)

    if upload_image.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: upload_image
    end
  end
end
