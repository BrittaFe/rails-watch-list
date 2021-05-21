class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  validates_associated :bookmarks
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
end
