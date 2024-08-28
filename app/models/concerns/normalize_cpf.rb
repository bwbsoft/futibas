# frozen_string_literal: true
module NormalizeCpf
  extend ActiveSupport::Concern

  included do
    before_validation :normalize_cpf
  end

  def normalize_cpf
    self.cpf = get_cpf_formatted(cpf)
  end

  def get_cpf_formatted(cpf)
    cpf.to_cpf_format
  end
end
