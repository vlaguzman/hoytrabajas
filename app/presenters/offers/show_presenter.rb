class Offers::ShowPresenter < ApplicationPresenter
  include ActionView::Helpers::NumberHelper

  def title_capitalize
    title.capitalize
  end

  def is_public?
    not confidential
  end

  def tags
    Hash.new.tap do |field|
      field[:location] = [source.city_description] if source.city.present?
      field[:job_categories] = source.job_categories.pluck(:description) if source.job_categories.any?
      field[:immediate_start] = [I18n.t('offers.show.tags.immediate_start')] if source.immediate_start
    end
  end

  def other_details
    [
      close_date_section,
      application_quantity_section
    ].compact.reject(&:blank?)
  end

  def description_capitalized
    source.description ? description.capitalize : ""
  end

  def im_offer_owner?
    options[:current_company].present? && source.company.eql?(options[:current_company])
  end

  def applied_offer_button_details
    Hash.new.tap do |field|
      field[:is_applied] = current_user_is_applied?
      field[:offer_id] = source.id
      field[:total_applications] = applied_candidades
      field[:path_applied_offers_rest] = rails_routes.applied_offers_rest_index_path
      field[:translations] = I18n.t('offers.show.applied_button')
    end
  end

  def current_user_is_applied?
    options[:current_user].present? && AppliedOffer.find_by(curriculum_vitae: options[:current_user].curriculum_vitae, offer: source).present?
  end

  def im_a_company?
    options[:current_company].present?
  end

  def in_preview?
    source.status.eql?(Offer::OFFER_STATUS[3])
  end

  def requirements_list
    [
      residence_requirement,
      experience_requirement,
      language_requirement,
      responsabilities_requirement,
      requirements_requirement
    ].compact.reject(&:blank?)
  end

  def offer_details_list
    [
      offer_detail_builder(detail: :work_position),
      offer_detail_builder(detail: :vacancies_quantity),
      offer_detail_builder(detail: :offer_type),
      offer_detail_builder(detail: :work_mode),
      offer_detail_builder(detail: :contract_type),
      salary_detail,
      mutiple_offer_detail_builder(detail: :available_work_days),
      mutiple_offer_detail_builder(detail: :working_days),
      mutiple_offer_detail_builder(detail: :job_aids)
    ].compact.reject(&:blank?)
  end

  def banner_path
    ENV['OFFER_SHOW_BANNER_PATH']
  end

  def company_details

    logo_path = company.logo.attached? ?
      rails_routes.rails_blob_path(company.logo, disposition: "attachment", only_path: true)
      : ENV['DEFAULT_IMAGE_LOGO_URL']

    Hash.new.tap do |field|
      field[:logo] = logo_path
      field[:logo_alt] = "#{company.name} logo"
      field[:name] = company.name
      field[:description] = company.description
      field[:city] = "#{company.city_description}, #{company.city_state_description}"
      field[:employees_range] = "#{company.employees_range_description} #{I18n.t('offers.show.company.employees_range.employees')}"
      field[:web_site] = company.web_site
    end
  end

  def related_offers
    Hash.new.tap do |field|
      field[:title] = "#{I18n.t('offers.show.related_offers')}"
      field[:list] = related_offers_list
    end
  end

  def affinity_percentage(value: nil)
    if options[:current_user].present?
      percentage = AffinityCalculator.new(source, options[:current_user]).affinity_percentage
      value = (percentage >= Offer::MIN_VALID_AFFINTY_PERCENTAGE) && "#{percentage}%"
    end

    value && field_builder(label: I18n.t('offers.show.affinity'), value: value)
  end

  private

  def currency_converter(value)
    number_to_currency(value, precision: 0, delimiter: '.')
  end

  def related_offers_list
    OffersService.related_offers_show_details(source.id, source.job_categories, options[:current_user])
  end

  def salary_detail
    salary_offer = OfferSalary.find_by(offer_id: source.id)

    value = I18n.t("offers.show.no_record")

    if(salary_offer.present?)
      salary_from = currency_converter(salary_offer.from)
      salary_to = salary_offer.to.present? ? "- #{currency_converter(salary_offer.to)}" : " "

      value = "#{salary_offer.currency_description} #{salary_from}#{salary_to}/ #{salary_offer.period_description}"
    end

    field_builder(
      label: I18n.t("offers.show.offer_details.salary"),
      value: value
    )
  end

  def mutiple_offer_detail_builder(detail: nil)
    called_detail = source.send(detail)

    value = I18n.t("offers.show.no_record")

    if(called_detail.any?)
      value = called_detail.pluck(:description).join(" - ")
    end

    field_builder(
      label: I18n.t("offers.show.offer_details.#{detail}"),
      value: value
    )
  end

  def offer_detail_builder(detail: nil)
    called_detail = source.send(detail)

    value = I18n.t("offers.show.no_record")

    if(called_detail.present?)
      value = called_detail.is_a?(String) || called_detail.is_a?(Numeric) ? called_detail : called_detail.description
    end

    field_builder(
      label: I18n.t("offers.show.offer_details.#{detail}"),
      value: value
    )
  end

  def responsabilities_requirement
    value = I18n.t("offers.show.no_record")

    if responsibilities.any?
      value = responsibilities.pluck(:description).join(", ")
    end

    field_builder(
      label: I18n.t('offers.show.requirements.responsabilities'),
      value: value
    )
  end

  def requirements_requirement
    value = I18n.t("offers.show.no_record")

    if requirements.any?
      value = requirements.pluck(:description).join(", ")
    end

    field_builder(
      label: I18n.t('offers.show.requirements.requirements'),
      value: value
    )
  end

  def language_requirement
    languages_offers_list = LanguagesOffers.where(offer_id: source.id)

    value = I18n.t("offers.show.no_record")

    if languages_offers_list.any?
      value = languages_offers_list
        .map { |language_offers| language_offers.offer_show_details }
        .join(", ")
    end

    field_builder(
      label: I18n.t('offers.show.requirements.language'),
      value: value
    )
  end

  def residence_requirement
    field_builder(
      label: I18n.t('offers.show.requirements.residence'),
      value: source.city.present? ? source.city_description : I18n.t("offers.show.no_record")
    )
  end

  def experience_requirement
    experience = OfferRequiredExperiences.find_by(offer_id: source.id)

    value = I18n.t('offers.show.requirements.no_required_experience')

    if experience.present?
      duration_description = experience.duration_type_description
      value = "#{experience.duration } #{duration_description}"
    end

    field_builder(
      label: I18n.t('offers.show.requirements.experience'),
      value: value
    )
  end

  def field_builder(label: '', value: nil)
    {label: label, value: value}
  end

  def close_date_section
    source.close_date.present? && Hash.new.tap do |field|
      field[:label] = I18n.t('offers.show.other_details.close_date')
      field[:value] = DatesManager.default(date: source.close_date)
    end
  end

  def application_quantity_section
    Hash.new.tap do |field|
      field[:label] = I18n.t('offers.show.other_details.applications')
      field[:value] = pretty_applied_candidades
    end
  end

  def pretty_applied_candidades
    "#{applied_candidades} #{I18n.t('companies.list_candidates.show.candidates')}"
  end

  def applied_candidades
    AppliedOffer.where(offer: source).count
  end

end