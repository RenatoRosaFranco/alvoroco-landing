# frozen_string_literal: true
class NewsletterMailer < ApplicationMailer

  default from: 'no-reply@alvoroco.com.br'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.signup.subject
  #
  def signup newsletter
    @newsletter = newsletter
    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.cancel.subject
  #
  def cancel newsletter
    @newsletter = newsletter
    mail to: "to@example.org"
  end
end
