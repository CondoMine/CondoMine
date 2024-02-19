class Ambiente < ApplicationRecord
  has_many :reservas
  has_many :items

  validates :nome, presence: true, format: { with: /\A[^0-9]+\z/, message: "can't have numbers" }, length: {minimum: 3}
  validates :tipo, presence: true, format: { with: /\A[^0-9]+\z/, message: "can't have numbers" }, length: {minimum: 5}
end
