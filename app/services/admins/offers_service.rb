module Admins::OffersService
  ASSOCIATIONS = [ "offer_salary", "offer_required_experiences", "offers_technical_skills", "languages_offers" ]
  ASSOCIATIONS_TO_COMPARE = [ "offers_technical_skills", "languages_offers" ]

  def self.call(update_params: {})
    offer = Offer.find(update_params[:id])
    persist_offer(offer, update_params)
  end

  def self.persist_offer(offer, update_params)
    cleaned_params = clean_params(update_params)
    response = Companies::FirstOffer::CommonService.update_source(offer, cleaned_params)

    offer = create_or_update_associations(response[:data], update_params)
    if offer.errors.present?
      { status: :error, data: offer }
    else
      { status: :ok, data: offer }
    end
  end

  def self.clean_params(params)
    {
      title:                  params[:title],
      description:            params[:description],
      vacancies_quantity:     params[:vacancies_quantity],
      close_date:             params[:close_date],
      immediate_start:        params[:immediate_start],
      required_experience:    params[:required_experience],
      status:                 params[:status],
      confidential:           params[:confidential],
      offer_type_id:          params[:offer_type_id],
      work_mode_id:           params[:work_mode_id],
      contract_type_id:       params[:contract_type_id],
      city_id:                params[:city_id],
      educational_degree_id:  params[:educational_degree_id],
    }.merge!(relation_params(params))
  end

  def self.relation_params(params)
    {
      job_category_ids:       prepare_ids(params[:job_categories]),
      work_position_ids:      prepare_ids(params[:work_positions]),
      sex_ids:                prepare_ids(params[:sexes]),
      age_range_list_ids:     prepare_ids(params[:age_range_lists]),
      available_work_day_ids: prepare_ids(params[:available_work_days]),
      working_day_ids:        prepare_ids(params[:working_days]),
      job_aid_ids:            prepare_ids(params[:job_aids]),
      # TODO uncomment when responsibilities and requirements has been defined
      #responsibility_ids:     prepare_ids(params[:responsibilities]),
      #requirement_ids:        prepare_ids(params[:requirements]),
      vehicle_ids:            prepare_ids(params[:vehicles]),
      driving_licence_ids:    prepare_ids(params[:driving_licences]),
    }
  end

  def self.create_or_update_associations(offer, params)
    persist_dinamic_association(offer, params)
    offer
  end

  def self.persist_dinamic_association(offer, params)
    ASSOCIATIONS.map { |association| persist_association(offer, association, params) }
  end

  def self.persist_association(offer, model, params)
    if validate_params(model, params)
      prepare_model_associated(offer, model, params)
    end
  end

  def self.validate_params(model, params)
    model_params = params[model.to_sym]
    validate_params_global(model_params) && validate_params_specific(model.to_sym, model_params)
  end

  def self.validate_params_global(model_params)
    if model_params.is_a?(Hash)
      remove_empty_keys(model_params).present?
    else
      model_params
        .map { |model_param| remove_empty_keys(model_param) }
        .map { |value| value.present? }
        .any?
    end
  end

  def self.remove_empty_keys(hash)
    HashesConverter.remove_empty_keys(hash)
  end

  def self.validate_params_specific(model, model_params)
    options = {
      age_range:                  -> { true },
      offer_salary:               -> { validate_offer_salary(model_params) },
      offer_required_experiences: -> { true },
      offers_technical_skills:    -> { true },
      languages_offers:           -> { true }
    }

    options[model].()
  end

  def self.validate_offer_salary(model_params)
    !remove_empty_keys(model_params).keys.eql?(["is_range"])
  end

  def self.get_hashes_with_at_least_one_value(hash)
    hash.select { |array| remove_empty_keys(hash).present? }
  end

  def self.prepare_model_associated(offer, model, params)
    params_model = params[model.to_sym]
    if params_model.is_a?(Hash)
      save_params_associated(offer, model, params_model)
    else
      params_model.map do |new_params|
        clean_model_params = get_hashes_with_at_least_one_value(new_params)
        save_params_associated(offer, model, clean_model_params) if clean_model_params.present?
      end
    end
  end

  def self.save_params_associated(offer, model, params_model)
    params = params_model.merge!(offer_id: offer.id)
    klass  = model.camelize.constantize
    create_or_update_model_associated(offer, model, klass, params)
  end

  def self.create_or_update_model_associated(offer, model, klass, params)
    parameters_to_find = parameters_to_find(offer, model, params)
    object = klass.find_by(parameters_to_find)
    object.present? ? update_model_associated(offer, model, object, params) : create_model_associated(offer, model, klass, params)
  end

  def self.parameters_to_find(offer, model, params)
    param_to_find = { offer_id: offer.id }
    param_to_find_relation = { id: params[:id] }
    if ASSOCIATIONS_TO_COMPARE.include?(model)
      param_to_find_relation
    else
      param_to_find.merge!(param_to_find_relation) if params[:id].present?
      param_to_find
    end
  end

  def self.update_model_associated(offer, model, object, params)
    object.update(params)
    persist_model_associated(offer, model, object, :update)
  end

  def self.create_model_associated(offer, model, klass, params)
    object = klass.new(params)
    persist_model_associated(offer, model, object, :create)
  end

  def self.persist_model_associated(offer, model, object, action)
    updated = object.save

    updated ? object : add_errors_to_offer(offer, model, object, action)
  end

  def self.add_errors_to_offer(offer, model, object, action)
    key_error = key_error(model, object, action)
    offer.errors.messages[key_error] << object.errors.messages

    offer.errors.add(:base, "#{fail_global_translation} #{model_translation(model)}")
  end

  def self.key_error(model, object, action)
    if ASSOCIATIONS_TO_COMPARE.include?(model) && action.eql?(:update)
      "#{model}_#{object.id}".to_sym
    else
      model.to_sym
    end
  end

  def self.fail_global_translation
    I18n.t('offer.form.messages.fail_global_update')
  end

  def self.model_translation(model)
    I18n.t("offer.form.labels.#{model}.label")
  end

  def self.prepare_ids(ids)
    ids.map(&:to_i).reject { |id| id == 0 }
  end
end
