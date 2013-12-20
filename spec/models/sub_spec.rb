require 'spec_helper'

describe Sub do
  describe "associations" do
    it { should have_many(:links)}
    it { should belong_to(:moderator)}
  end
end
