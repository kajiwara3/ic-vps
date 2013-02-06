# coding: utf-8
class ReportMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.report_mailer.contact_received.subject
  #
  def contact_received(contact)
    @contact = contact
    mail subject: "お問い合わせ通知メール",
         to: IcVps::Application.config.notification_email,
         from: 'info@ic-vps.com'
  end
end
