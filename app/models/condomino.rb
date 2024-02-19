class Condomino < ApplicationRecord
<<<<<<< HEAD
=======
  has_many :reservas

>>>>>>> ab6b922d7a460b65d280ece36792e9b5035059c8
  validates :nome, presence: true, length: {minimum: 5}, numericality: false
  validates :cpf, presence: true, length: {maximum: 11}, uniqueness: true, numericality: {only_integer: true}
  validates :contato, presence: true, uniqueness: true, confirmation: { case_sensitive: false }
end
