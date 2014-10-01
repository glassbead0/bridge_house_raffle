require "rails_helper"

RSpec.describe Recipt, :type => :mailer do
  describe "recipt_wepay" do
    let(:mail) { Recipt.recipt_wepay }

    it "renders the headers" do
      expect(mail.subject).to eq("Recipt wepay")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "recipt_other" do
    let(:mail) { Recipt.recipt_other }

    it "renders the headers" do
      expect(mail.subject).to eq("Recipt other")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
