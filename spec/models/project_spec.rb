require 'rails_helper'

RSpec.describe Project, type: :model do
  it "when cloned will have the right ancestry" do
    p1 = create(:project)
    p2 = p1.remix
    p2.save!
    expect(p2.parent).to eq(p1)
    expect(p1.children).to include(p2)
  end
end
