class Companies::FirstOffer::StepOnePresenter < ApplicationPresenter

  def form_info
    {
      title: I18n.t("companies.first_offer.step_ones.show.title"),
      subtitle: I18n.t("companies.first_offer.step_ones.show.subtitle"),
      form: {
        buttons: {
          submit: 'Siguiente',
          previous: '',
          next: ''
        },
        action: Rails.application.routes.url_helpers.companies_first_offer_step_one_path,
        method: 'PUT',
        type: 'company',
        formFields: {
          name: {
            name: 'company[name]',
            label: I18n.t("companies.first_offer.step_ones.show.form.formFields.name")
          },
          industry_id: {
            name: 'company[industry_id]',
            label: I18n.t("companies.first_offer.step_ones.show.form.formFields.name"),
            values: industries_values
          },
          contact_work_position: {
            name: 'company[contact_work_position]',
            label: I18n.t("companies.first_offer.step_ones.show.form.formFields.name")
          },
          contact_name: {
            name: 'company[contact_name]',
            label: I18n.t("companies.first_offer.step_ones.show.form.formFields.name")
          },
          contact_cellphone: {
            name: 'company[contact_cellphone]',
            label: I18n.t("companies.first_offer.step_ones.show.form.formFields.name")
          },
          employees_range_id: {
            name: 'company[employees_range_id]',
            label: I18n.t("companies.first_offer.step_ones.show.form.formFields.name"),
            values: employees_range_values
          }
        }
      }
    }
  end

  private

  def industries_values
    ListConverter.model_list Industry
  end

  def employees_range_values
    ListConverter.model_list EmployeesRange
  end
end
