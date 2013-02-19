# coding: utf-8
class Administrator < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  include EmailAddressChecker

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true
  validate  :check_email

  private
  def check_email
    if email.present?
      errors.add(:email, :invalid) unless
        well_formed_as_email_address(email)
    end
  end

  class << self
    def authenticate(email, password)
      administrator = find_by_email(email)
      if administrator && administrator.hashed_password.present? &&
          BCrypt::Password.new(administrator.hashed_password) == password
        administrator
      else
        nil
      end
    end

    def search(query, page)
      rel = order("id")
      if query.present?
        rel = rel.where("name LIKE ?", "%#{query}%").
          paginate(page: page, per_page: 5)
      end
    end
  end
end
