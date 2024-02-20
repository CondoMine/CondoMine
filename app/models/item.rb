class Item < ApplicationRecord
  belongs_to :ambiente

  validates :nome, presence: true, format: { with: /\A[^0-9]+\z/, message: "can't have numbers" }, length: {minimum: 3}
  validates :tipo, presence: true, format: { with: /\A[^0-9]+\z/, message: "can't have numbers" }, length: {minimum: 3}
  validates :estado, presence: true, format: { with: /\A[^0-9]+\z/, message: "can't have numbers" }, length: {minimum: 3}

  validates :data_entrada, presence: { message: "deve ser fornecida" }
  validate :data_entrada_nao_posterior_a_hoje

  private

  def data_entrada_nao_posterior_a_hoje
    if data_entrada.present? && data_entrada > Time.zone.today
      errors.add(:data_entrada, "não pode ser posterior à data atual")
    end
  end

end
