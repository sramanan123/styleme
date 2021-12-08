class Api::V1::ImageCommentsController < Api::V1::GraphitiController
  def index
    image_comments = ImageCommentResource.all(params)
    respond_with(image_comments)
  end

  def show
    image_comment = ImageCommentResource.find(params)
    respond_with(image_comment)
  end

  def create
    image_comment = ImageCommentResource.build(params)

    if image_comment.save
      render jsonapi: image_comment, status: :created
    else
      render jsonapi_errors: image_comment
    end
  end

  def update
    image_comment = ImageCommentResource.find(params)

    if image_comment.update_attributes
      render jsonapi: image_comment
    else
      render jsonapi_errors: image_comment
    end
  end

  def destroy
    image_comment = ImageCommentResource.find(params)

    if image_comment.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: image_comment
    end
  end
end
