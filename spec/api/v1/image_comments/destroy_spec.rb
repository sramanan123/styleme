require 'rails_helper'

RSpec.describe "image_comments#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/image_comments/#{image_comment.id}"
  end

  describe 'basic destroy' do
    let!(:image_comment) { create(:image_comment) }

    it 'updates the resource' do
      expect(ImageCommentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { ImageComment.count }.by(-1)
      expect { image_comment.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
