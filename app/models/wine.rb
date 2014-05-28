class Wine < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites

  validates :name, presence: true
  validates :image_url, presence: true


  #
  # => for later self page search
  #
  # def self.search(query)
  #   if query
  #     where('name ILIKE ?', "%#{query}%")
  #   else
  #     all
  #   end
  # end
end
