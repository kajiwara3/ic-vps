class Administrator < ActiveRecord::Base
  include EmailAddressChecker

  attr_accessor :password, :password_confirmation
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true
  validate  :check_email
  validates :password, presence: { on: :create },
    confirmation: { allow_blank: true }

  def password=(password)
    if password.present?
      self.hashed_password = BCrypt::Password.create(password)
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
      administrator = find_by_email(email)
      if administrator && administrator.hashed_password.present? &&
          BCrypt::Password.new(administrator.hashed_password) == password
        administrator
      else
        nil
      end
    end

    def search(query)
      rel = order("id")
      if query.present?
        rel = rel.where("name LIKE ?", "%#{query}%").
          paginate(page: params[:page], per_page: 5)
      end
    end
  end
end
