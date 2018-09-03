RSpec.describe Ride, type: :model do
  context "validations" do
    context "presence" do
      it {  validate_presence_of :time }
      it { should validate_presence_of :remaining_capacity }
      it { should validate_presence_of :origin }
      it { should validate_presence_of :destination }
    end
  end
  context "associations" do
    it { should belong_to(:vehicle) }
    it { should have_many(:requests) }
  end
end