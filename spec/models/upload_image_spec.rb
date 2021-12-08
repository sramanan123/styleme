require 'rails_helper'

RSpec.describe UploadImage, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:image_comments) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
