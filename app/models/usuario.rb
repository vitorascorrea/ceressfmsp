class Usuario < ActiveRecord::Base
  has_one :floricultura
  has_secure_password
end
