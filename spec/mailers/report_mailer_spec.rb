require "spec_helper"

describe ReportMailer do
  describe "contact_received" do
    let(:mail) { ReportMailer.contact_received }

    it "renders the headers" do
      mail.subject.should eq("Contact received")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
