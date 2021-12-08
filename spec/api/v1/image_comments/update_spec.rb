require 'rails_helper'

RSpec.describe "image_comments#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/image_comments/#{image_comment.id}", payload
  end

  describe 'basic update' do
    let!(:image_comment) { create(:image_comment) }

    let(:payload) do
      {
        data: {
          id: image_comment.id.to_s,
          type: 'image_comments',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ImageCommentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { image_comment.reload.attributes }
    end
  end
end
