class Condomino < ApplicationRecord

  has_many :reservas

  validates :nome, presence: true, length: {minimum: 5}, numericality: false
  validates :cpf, presence: true, length: {maximum: 11}, uniqueness: true, numericality: {only_integer: true}
  validates :contato, presence: true, uniqueness: true, confirmation: { case_sensitive: false }
end
