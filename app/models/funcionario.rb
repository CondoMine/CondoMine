class Funcionario < ApplicationRecord

  validates :nome, presence: true, length: {minimum: 5}, numericality: false
  validates :cpf, presence: true, uniqueness: true, format: { with: /\A\d{11}\z/, message: "deve ter 11 dígitos numéricos" }
  validates :funcao, presence: true, length: {minimum: 5}

end
