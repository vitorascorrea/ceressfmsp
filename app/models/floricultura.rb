class Floricultura < ActiveRecord::Base
  has_many :chamados
  has_secure_password
end
