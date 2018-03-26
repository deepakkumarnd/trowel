class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  ROLES = %w[admin manager user]

  validates :role, presence: true
  validates :role, inclusion: { in: ROLES }

  def mark_as_deleted!
  end
end
