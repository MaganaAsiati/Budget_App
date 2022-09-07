class Deal < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :author_id
  belongs_to :category, class_name: 'Category', foreign_key: :category_id

  validates :name, length: { minimum: 1 }
  validates :amount, numericality: { only_integer: true, greater_than: 0 }

end
