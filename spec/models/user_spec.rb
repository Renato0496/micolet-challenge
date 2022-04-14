require 'rails_helper'

RSpec.describe User, type: :model do
  it "Invalid user without data" do
    user1 = User.create()
    expect(user1).to_not be_valid
  end

  it "Invalid user without preferences" do
    user2 = User.new(email: "riar96@gmail.com")
    user2.save
    expect(user2).to_not be_valid
  end

  it "Invalid user without email" do
    user3 = User.new()
    pref3 = Preference.create(title: "lalala")
    user3.preferences.push(pref3)
    user3.save
    expect(user3).to_not be_valid
  end

  it "Valid user with valid email and preferences" do
    user4 = User.new(email: "riar96@gmail.com")
    pref4 = Preference.create(title: "lelele")
    user4.preferences.push(pref4)
    user4.save
    expect(user4).to be_valid
  end
end
