class UsersController < ApplicationController

  def edit
    @user = current_user
    @nationalities = Nationality.all
    @document_types = DocumentType.all

  end

  def update
    @nationalities = Nationality.all
    @document_types = DocumentType.all
    @limitations = Limitation.all
    @sexes = Sex.all
    @educational_degrees = EducationalDegree.all

    self.send(params[:operation])
  end

  private

  #TODO i dont know  where move this
  def step_one_params(user, cv)
    candidate_step_one_params.tap do |field|
      user.curriculum_vitaes << cv
      field[:nationalities].reject(&:empty?).each { |nationality| user.nationalities << Nationality.find_by(id: nationality) }
      user.document_type = DocumentType.find_by(id: field[:document_type])

      field.except!(:document_type, :nationalities)
    end
  end

  def step_two_params(user)
    candidate_step_two_params.tap do |field|
      user.sex = Sex.find_by(id: field[:sex] )
      field[:limitations].reject(&:empty?).each { |limitation| user.limitations << Limitation.find_by(id: limitation) }
      field[:educational_degrees].reject(&:empty?).each { |degree| user.educational_degrees << EducationalDegree.find_by(id: degree) }

      field.except!(:limitations, :educational_degrees, :sex)
    end
  end

  #TODO move to a service
  def step_one
    #TODO move this logic to a service when Julian approve the
    #first step feature spec

    #TODO railsway, when a object payload have all cv date create the CV

    @user = current_user

    #temporal values for the associations
    cv = CurriculumVitae.new({
      user: @user,
      city: City.last,
      work_mode: WorkMode.last,
      contract_type: ContractType.last,
      labor_disponibility: LaborDisponibility.last
    })

    cv.save

    #TODO send array ids from the view
    #candidate_step_one_params.tap { |field| field[:nationalities] = [field[:nationalities]] }

    if @user.update(step_one_params(@user, cv))
      render "users/candidates/step_two"
    else
      render "edit"
    end
    #TODO send a param with the step to change to required view
  end

  def step_two
    @user = current_user

    cv = current_user.curriculum_vitaes.last

    step_params = step_two_params(@user)

    #TODO find other waay to do that
    cv.about_me = step_params[:about_me]
    cv.save

    if @user.update(step_params)
      render "users/candidates/step_three"
    else
      render "users/candidates/two"
    end
  end

  #strong params
  def candidate_step_one_params
    params.require(:user).permit(:name, :last_name, :document_type, :contact_number, :identification_number, nationalities: []).to_h
  end

  def candidate_step_two_params
    params.require(:user).permit(:about_me, :sex, :birthday, {limitations: [], educational_degrees: []} ).to_h
  end
end