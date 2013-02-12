# coding: utf-8
require "spec_helper"

describe ReportMailer do
  before do
    @contact = Factory.create :contact1
  end
  describe "contact_received" do
    let(:mail) { ReportMailer.contact_received @contact }

    it "renders the headers" do
      mail.subject.should eq("お問い合わせ通知メール")
      mail.to.should eq(["ic-vps@stf.ic-net.or.jp"])
      mail.from.should eq(["info@ic-vps.com"])
    end

    it "renders the body" do
      mail.body.encoded.should =~ /お問い合わせがありました。/
    end
  end

end
