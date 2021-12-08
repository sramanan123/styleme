require 'rails_helper'

RSpec.describe ImageComment, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:commentor) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
