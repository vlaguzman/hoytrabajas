class Users::Wizards::StepTens::AddedAcknowledgmentsController < ApplicationController

  def show
    acknowledgment_presenter(
      Acknowledgment.find_by(id: acknowledgment_id)
    )
  end

  private

  def acknowledgment_presenter(acknowledgment)
    @acknowledgment = Users::Wizards::StepTens::AcknowledgmentPresenter.new(acknowledgment)
  end

  def acknowledgment_id
    params.permit(:id).to_h[:id]
  end

end