class Wine < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0}
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
