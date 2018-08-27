RSpec.describe Ride, type: :model do
  context "validations" do
    context "presence" do
      it { should validate_presence_of :time }
      it { should validate_presence_of :remaining_capacity }
      it { should validate_presence_of :from }
      it { should validate_presence_of :to }
    end
  end
  context "associations" do
    it { should belong_to(:vehicle) }
    it { should have_many(:requests) }
  end
end