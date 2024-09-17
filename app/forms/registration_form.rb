class RegistrationForm
  include ActiveModel::Model

  attr_accessor :email, :password, :password_confirmation
  attr_accessor :country, :city, :street, :house, :apartment
  attr_accessor :card_number, :card_name, :balance

  validates :email, :password, :password_confirmation, presence: true
  validates :password, confirmation: true
  validates :country, :city, :street, :house, :apartment, presence: true
  validates :card_number, :card_name, :balance, presence: true

  def save
    return false unless valid?

    ActiveRecord::Base.transaction do
      create_user
      create_address
      create_virtual_card
      send_emails
    end
    true
  rescue ActiveRecord::RecordInvalid
    false
  end

  private

  def create_user
    @user = User.create!(
      email: email,
      password: password,
      password_confirmation: password_confirmation
    )
  end

  def create_address
    @user.create_address!(
      country: country,
      city: city,
      street: street,
      house: house,
      apartment: apartment
    )
  end

  def create_virtual_card
    @user.create_virtual_card!(
      card_number: card_number,
      name: card_name,
      balance: balance
    )
  end

  def send_emails
    RegistrationService.new(@user).call
  end
end
