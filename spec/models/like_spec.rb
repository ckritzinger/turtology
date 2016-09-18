require 'rails_helper'

RSpec.describe Like, type: :model do
  it "is unique per user and project" do
    u = create(:user)
    p = create(:project)
    expect(Like.create(user: u, project: p)).to be_valid
    expect(Like.create(user: u, project: p)).to_not be_valid
  end
end
