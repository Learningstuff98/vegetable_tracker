class User < ApplicationRecord
  has_many :years
  attr_accessor :login
  validates :username, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.find_for_database_authentication warden_conditions
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
  end

  def search(keyword)
    if keyword.present?
      self.years.where("year_number ILIKE ?", "%#{keyword}%") 
    else
      self.years.order("created_at DESC")
    end
  end
end
