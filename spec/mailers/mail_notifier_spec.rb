require "rails_helper"

RSpec.describe MailNotifier, type: :mailer do

  describe "#general_notification" do
    let(:message) do
      { stuff_1: "Text 1", stuff_2: "Text 2" }
    end

    let(:mail) { described_class.general_notification(message) }

    context "When is called a notification" do
      it "Should dispatch a mail" do
        expect(mail.subject).to eq("Reporte diario de actuaizacion de ofertas")
        expect(mail.to).to eq(["tecnologia@hoytrabajas.com"])
        expect(mail.from).to eq(["notification@hoytrabajas.com"])
      end

      it "renders the body" do
        expect(mail.body.encoded).to match("Text 2")
      end
    end
  end

end