require 'rails_helper'

RSpec.describe "image_comments#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/image_comments", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'image_comments',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(ImageCommentResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { ImageComment.count }.by(1)
    end
  end
end
