require 'spec_helper'

describe User do

  context 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  it "has a valid factory" do 
    expect(create(:user)).to be_valid
  end

  it "is valid with a username, email, and password" do
    expect(create(:user)).to be_valid
  end

  it "is invalid without a username" do
    expect(build(:user, username: nil)).to have(1).errors_on(:username)
  end

  it "is invalid without an email" do
    expect(build(:user, email: nil)).to have(1).errors_on(:email)
  end

  it "is invalid without a password" do
    # will through 2 as there is the associated confirmation
    expect(build(:user, password: nil)).to have(2).errors_on(:password)
  end

end
