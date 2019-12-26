class User < ApplicationRecord
    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = %w(admin estudiante profesor).freeze
  validates :role, inclusion: { in: ROLES }

  include PermissionsConcern
end
