class UserMailer < ApplicationMailer
    default from: 'everybody@appacademy.io'

    def welcome_email(user)
        @user = user
        @url = 'http://example.com/login'
        mail(to: user.email, subject: 'This is my automated email')
    end
end
