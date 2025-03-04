require "rails_helper"

RSpec.describe(User, type: :model) do
  it "ok" do
    user = build(:user)
    expect(user.valid?).to(be_truthy)
  end

  it "role is nil" do
    user = build(:user, role: "")
    expect(user.valid?).to(be_falsey)
  end

  it "email is nil" do
    user = build(:user, email: nil)
    expect(user.valid?).to(be_falsey)
  end

  it "password is nil" do
    user = build(:user, password: "")
    expect(user.valid?).to(be_falsey)
  end
end
