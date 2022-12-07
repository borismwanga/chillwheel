class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  # def welcome(user)
  #   @user = user # Instance variable => available in view
  #   mail to: user.email, subject: "Welcome to ChillWheel"
  #   # This will render a view in `app/views/user_mailer`!
  # end

  # def notification(user, spot)
  #   @user = user
  #   @url = "https://wwww.chillwheel.com/spots/#{spot.id}"
  #   mail(to: @user.email, subject: "News regarding your stolen bike.")
  # end
end
