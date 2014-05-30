require 'spec_helper'

describe User do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_numericality_of(:age).is_greater_than_or_equal_to(21)}
  it { should validate_presence_of(:email) }
  it { should have_many(:wines).through(:favorites) }
  it { should have_many(:favorites)}
end




