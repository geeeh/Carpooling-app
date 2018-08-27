require 'rails_helper'
RSpec.describe Request, type: :model do
  context "validations" do
    context "presence" do
      it { should validate_presence_of :pickup }
      it { should validate_presence_of :status }
    end
  end

  context "associations" do
    it { should belong_to(:ride) }
  end
end