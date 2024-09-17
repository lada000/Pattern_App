class RegistrationsController < ApplicationController
  def new
    @registration_form = RegistrationForm.new
  end

  def create
    @registration_form = RegistrationForm.new(registration_params)
    if @registration_form.save
      sign_in(@registration_form.instance_variable_get(:@user))
      redirect_to dashboard_path, notice: 'Registration successful!'
    else
      render :new
    end
  end

  private

  def registration_params
    params.require(:registration_form).permit(
      :email, :password, :password_confirmation,
      :country, :city, :street, :house, :apartment,
      :card_number, :card_name, :balance
    )
  end
end
