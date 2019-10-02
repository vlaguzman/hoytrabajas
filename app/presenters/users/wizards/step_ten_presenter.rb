class Users::Wizards::StepTenPresenter < ApplicationPresenter

  def registered_acknowledgments
    cv_id = source.curriculum_vitaes.first.id
    Acknowledgment.where(curriculum_vitae_id: cv_id).map { |act| [act.title] }
  end

  def have_acknowledgments?
    registered_acknowledgments.any?
  end

  def registered_acknowledgments_message
    count = registered_acknowledgments.count
    if count >= 1
      "Llevas #{count} registro(s) de reconocimientos"
    end
  end
end