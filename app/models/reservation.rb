class Reservation < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :first_name, :last_name, :address, :post_code, :city, :country, :telephone, :email, :confirm_email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :confirm_email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :email_confirmation_matches

  private

  def email_confirmation_matches
    errors.add(:confirm_email, "Email doesn't match") if email != confirm_email
  end

end