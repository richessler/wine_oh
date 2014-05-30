require 'spec_helper'

describe Favorite do
  it { should belong_to(:user) }
  it { should belong_to(:wine) }
  it { should have_db_column(:rating).of_type(:integer) }
end
