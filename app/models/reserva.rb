class Reserva < ApplicationRecord
  belongs_to :ambiente
  belongs_to :condomino

  validates :data_ini, presence: { message: "A data de início deve ser fornecida" }
  validates :data_fim, presence: { message: "A data de término deve ser fornecida" }
  validates :hora_ini, presence: true
  validates :hora_fim, presence: true

  validate :data_ini_deve_ser_anterior_a_data_fim
  validate :verificar_disponibilidade_do_ambiente

  private

  def data_ini_deve_ser_anterior_a_data_fim
    # Converte data e hora em objetos DateTime para comparação
    inicio = DateTime.parse("#{data_ini} #{hora_ini}")
    fim = DateTime.parse("#{data_fim} #{hora_fim}")

    if inicio >= fim
      errors.add(:data_ini, "A data e hora de início devem ser anteriores à data e hora de término")
    end
  end

  def verificar_disponibilidade_do_ambiente
    return unless data_ini.present? && data_fim.present? && hora_ini.present? && hora_fim.present?

    Reserva.where(ambiente_id: ambiente_id).where.not(id: id).find_each do |reserva_existente|
      inicio_existente = DateTime.parse("#{reserva_existente.data_ini} #{reserva_existente.hora_ini}")
      fim_existente = DateTime.parse("#{reserva_existente.data_fim} #{reserva_existente.hora_fim}")
      novo_inicio = DateTime.parse("#{data_ini} #{hora_ini}")
      novo_fim = DateTime.parse("#{data_fim} #{hora_fim}")

      # Verifica se a nova reserva se sobrepõe a uma reserva existente
      if (novo_inicio < fim_existente) && (novo_fim > inicio_existente)
        errors.add(:base, "O ambiente já está reservado para as datas e horários selecionados")
        break # Sai do loop assim que uma sobreposição é encontrada
      end
    end
  end
end
