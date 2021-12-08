require 'rails_helper'

RSpec.describe ImageCommentResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'image_comments',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ImageCommentResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { ImageComment.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:image_comment) { create(:image_comment) }

    let(:payload) do
      {
        data: {
          id: image_comment.id.to_s,
          type: 'image_comments',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ImageCommentResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { image_comment.reload.updated_at }
      # .and change { image_comment.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:image_comment) { create(:image_comment) }

    let(:instance) do
      ImageCommentResource.find(id: image_comment.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { ImageComment.count }.by(-1)
    end
  end
end
