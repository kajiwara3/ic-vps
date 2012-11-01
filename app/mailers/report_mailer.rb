class ReportMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.report_mailer.contact_received.subject
  #
  def contact_received
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
