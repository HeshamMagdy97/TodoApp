class User < ApplicationRecord
  has_one :todo
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist
end
