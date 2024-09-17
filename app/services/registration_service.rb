class RegistrationService
  def initialize(user)
    @user = user
  end

  def call
    send_user_email
    send_admin_email
  end

  private

  def send_user_email
    UserMailer.welcome_email(@user).deliver_now
  end

  def send_admin_email
    AdminMailer.new_user_registered(@user).deliver_now
  end
end
