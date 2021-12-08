require "rails_helper"

RSpec.describe "image_comments#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/image_comments", params: params
  end

  describe "basic fetch" do
    let!(:image_comment1) { create(:image_comment) }
    let!(:image_comment2) { create(:image_comment) }

    it "works" do
      expect(ImageCommentResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["image_comments"])
      expect(d.map(&:id)).to match_array([image_comment1.id, image_comment2.id])
    end
  end
end
