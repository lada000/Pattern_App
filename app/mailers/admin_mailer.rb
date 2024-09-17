class AdminMailer < ApplicationMailer
  def new_user_registered(user)
    @user = user
    mail(to: 'admin@example.com', subject: 'New User Registration')
  end
end
