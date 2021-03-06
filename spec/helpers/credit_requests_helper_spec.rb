require "rails_helper"

describe CreditRequestsHelper do
  context 'When checking available periods' do
    it 'does call verifier correctly' do
      expected_response = [1,2,3]
      allow_any_instance_of(MonthlyFeeVerifier)
        .to receive(:available_periods)
          .and_return(expected_response)

      subject = helper.available_periods

      expect(subject).to eq(expected_response)
    end
  end

  context 'When showing approve link' do
    it 'does return formed link' do
      credit_request = create(:credit_request)

      subject = helper.show_approve_button_for(credit_request)

      expect(subject).to include('Aprovar')
    end
  end

  context 'When trying to show approve link for an approved request' do
    it 'does return nil' do
      credit_request = create(:credit_request)

      credit_request.approved!
      subject = helper.show_approve_button_for(credit_request)

      expect(subject).to be_nil
    end
  end
end
