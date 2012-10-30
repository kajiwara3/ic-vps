# coding: utf-8
class Partner < ActiveRecord::Base
  has_many :private_servers, dependent: :destroy
  has_many :contact
  accepts_nested_attributes_for :private_servers, allow_destroy: true

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :name_kana, :address, :email, :password, :password_confirmation, :remember_me
  include EmailAddressChecker

  attr_accessor :password, :password_confirmation

  # バリデーションメソッド
  validates :name, presence: true, length: { maximum: 50 }
  validates :name_kana, presence: true, length: { maximum: 100 }
  validates :address, presence: true, length: { maximum: 100 }
#  validates :email, presence: true
#  validate  :check_email
#  validates :password, presence: { on: :create },
#    confirmation: { allow_blank: true }

  def password=(password)
    if password.present?
      self.encrypted_password = BCrypt::Password.create(password)
    end
    @password = password
  end

  private
  def check_email
    if email.present?
      errors.add(:email, :invalid) unless
        well_formed_as_email_address(email)
    end
  end

  class << self
    def authenticate(email, password)
      partner = find_by_email(email)
      if partner && partner.encrypted_password.present? &&
          BCrypt::Password.new(partner.encrypted_password) == password
        partner
      else
        nil
      end
    end
  end
end
