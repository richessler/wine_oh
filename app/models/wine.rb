class Wine < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites

  validates :name, presence: true
  validates :image_url, presence: true

end
