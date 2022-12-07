class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user # Instance variable => available in view
    mail to: user.email, subject: "Welcome to ChillWheel"
    # This will render a view in `app/views/user_mailer`!
  end
end

def notification(spot)
  @spot = Spot.new
  @spot = Spot.find(params[:spot_id])
  console.log(spot.id)
  @user = User.find(params[:user_id])
  @user.id = Spot.user_id
  console.log(@user.username)
  @url  = “https://wwww.chillwheel.com/spots/#{[:spot_id]}”
  mail(to: @user.email, subject: "News regarding your stolen bike.")
end
