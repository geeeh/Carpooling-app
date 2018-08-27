require 'rails_helper'
RSpec.describe User, type: :model do
  context "validations" do
    context "presence" do
      it { should validate_presence_of :email }
      it { should validate_presence_of :password }
    end

    context "uniqueness" do
      it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    end
  end

  context "associations" do
    it { should have_many(:vehicles) }
  end
end