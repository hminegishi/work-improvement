class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :category_id, numericality: { other_than: 1 }
  validates :title, presence: true
  validates :text, presence: true
end
