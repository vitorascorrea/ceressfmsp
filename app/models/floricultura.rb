class Floricultura < ActiveRecord::Base
  has_one :usuario
  has_many :chamados
 end
