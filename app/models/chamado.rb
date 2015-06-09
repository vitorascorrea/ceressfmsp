class Chamado < ActiveRecord::Base 
  validates :nomec, :nomef, :telefone1, :cpf, :endvel, :datahorariovel, presence: true
  
end