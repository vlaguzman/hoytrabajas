require "rails_helper"

RSpec.describe MailNotifier, type: :mailer do

  describe "#general_notification" do
    let(:message) do
      { stuff_1: "Text 1", stuff_2: "Text 2" }
    end

    context "When is called a notification of update offers" do
      let(:mail) { described_class.general_notification('daily_update_offers', message) }

      it "Should dispatch a mail" do
        expect(mail.subject).to eq("Reporte diario de actuaizacion de ofertas")
        expect(mail.to).to eq(["tecnologia@hoytrabajas.com"])
        expect(mail.from).to eq(["notification@hoytrabajas.com"])
      end

      it "renders the body" do
        expect(mail.body.encoded).to match("Text 2")
      end
    end

    context "When is called a notification of affinity percentages" do
      let(:mail) { described_class.general_notification('daily_create_affinity_percentages', message) }

      it "Should dispatch a mail" do
        expect(mail.subject).to eq("Reporte diario de creacion de affinity percentages")
        expect(mail.to).to eq(["tecnologia@hoytrabajas.com"])
        expect(mail.from).to eq(["notification@hoytrabajas.com"])
      end

      it "renders the body" do
        expect(mail.body.encoded).to match("Text 2")
      end
    end
  end

end
