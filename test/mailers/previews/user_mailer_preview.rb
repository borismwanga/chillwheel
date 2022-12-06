# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    user = User.first
    # @user = User.find(params[:id])
    UserMailer.welcome(user)
  end

  def notification
    user = User.first
    UserMailer.with(user).notification
  end
end
