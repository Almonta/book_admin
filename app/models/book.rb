class Book < ApplicationRecord
  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :name, presence: true
  validates :name, length: { maximum: 25 }
  validates :price, numericaliity: { greater_than_or_equal_to: 0 }

  before_validation do
    self.name = self.name.gsub(/Cat/) do |matched|
      "Lovely #{matched}"
    end
  end
  after_destroy do
    Rails.logger.info "Book is deleted: #{self.attributes}"
  end
end
