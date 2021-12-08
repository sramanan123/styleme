require 'rails_helper'

RSpec.describe ImageCommentResource, type: :resource do
  describe 'serialization' do
    let!(:image_comment) { create(:image_comment) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(image_comment.id)
      expect(data.jsonapi_type).to eq('image_comments')
    end
  end

  describe 'filtering' do
    let!(:image_comment1) { create(:image_comment) }
    let!(:image_comment2) { create(:image_comment) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: image_comment2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([image_comment2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:image_comment1) { create(:image_comment) }
      let!(:image_comment2) { create(:image_comment) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            image_comment1.id,
            image_comment2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            image_comment2.id,
            image_comment1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
