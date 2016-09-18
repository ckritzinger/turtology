require 'rails_helper'

RSpec.describe User, type: :model do
  it "can only like a project once" do
    u = create(:user)
    p = create(:project)
    expect{u.like!(p)}.to change{Like.count}.by(1)
    expect{u.like!(p)}.to change{Like.count}.by(0)
  end
end
