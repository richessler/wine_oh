require 'spec_helper'

describe Wine do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:image_url) }
  it { should have_many(:favorites) }
  it { should have_many(:users).through(:favorites) }
end


