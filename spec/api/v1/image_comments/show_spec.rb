require 'rails_helper'

RSpec.describe "image_comments#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/image_comments/#{image_comment.id}", params: params
  end

  describe 'basic fetch' do
    let!(:image_comment) { create(:image_comment) }

    it 'works' do
      expect(ImageCommentResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('image_comments')
      expect(d.id).to eq(image_comment.id)
    end
  end
end
