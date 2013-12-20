require 'spec_helper'

describe User do

  # before(:each) do
  #   u = User.new
  # end

  it "requires a username" do
    u = User.new
    expect(u).to have_at_least(1).error_on(:username)
  end

  it "requires a password_digest" do
    u = User.new
    expect(u).to have_at_least(1).error_on(:password_digest)
  end

  it "requires a password >= 6 chars" do
    u = User.new
    u.password = "abcde"
    expect(u).to have_at_least(1).error_on(:password)
  end

  it "requires a session_token" do
    u = FactoryGirl.create(:user)
    expect(u.session_token).not_to be_nil
  end

  it "has session_token of correct length" do
    u = FactoryGirl.create(:user)
    expect(u.session_token.length).to eq("vmHplnf4VegcIakk2iXI6Q".length)
  end

  it "finds a user by credentials" do
    u = FactoryGirl.create(:user)
    expect(User.find_by_credentials(u.username, u.password)).to be_a(User)
  end

  it "does not store plaintext password" do
    u = FactoryGirl.create(:user)
    expect(User.find_by_username(u.username).password).to be_nil
  end

  it "does allow mass assignability" do
    expect(User.new(username: "Hello", password: "World")).not_to raise_error
  end

  describe "associations" do
    it { should have_many(:subs)}
    it { should have_many(:links)}
  end
end
