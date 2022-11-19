require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(email: "user@mail.com", password: "password")
  end
  it "is valid with valid attributes" do
    expect(@user).to be_valid
  end
end
