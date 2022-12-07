# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
# class UserMailerPreview < ActionMailer::Preview
#   # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
#   def welcome
#     user = User.first
#     # @user = User.find(params[:id])
#     UserMailer.welcome(user)
#   end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    # user = User.last
    user = User.find(current_user)
    UserMailer.welcome(user)
  end

  def notification
    @spot = Spot.new
    @spot = Spot.find(params[:spot_id])
    @user.id = Spot.user_id
    UserMailer.with(user: @user).notification
  end

end

#   def notification
#     user = User.first
#     UserMailer.with(user).notification
#   end
# end
