require 'rails_helper'

RSpec.describe Account, type: :model do
  context "validations" do
    context "presence" do
      it { should validate_presence_of :identifaction }
      it { should validate_presence_of :phone_number }
      it { should validate_presence_of :first_name }
      it { should validate_presence_of :last_name }
    end
  end

  context "associations" do
    it { should have_one(:user) }
  end
end
