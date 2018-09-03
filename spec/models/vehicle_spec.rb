RSpec.describe Vehicle, type: :model do
  context "validations" do
    context "presence" do
      it { should validate_presence_of :plate }
      it { should validate_presence_of :make }
      it { should validate_presence_of :colour }
      it { should validate_presence_of :capacity }
    end

    context "uniqueness" do
      it { should validate_uniqueness_of :plate }
    end
  end

  context "associations" do
    it { should belong_to(:user) }
    it { should have_many(:rides) }
  end
end