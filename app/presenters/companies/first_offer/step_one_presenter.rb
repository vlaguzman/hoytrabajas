class Companies::FirstOffer::StepOnePresenter < ApplicationPresenter

  def industries_values
    Industry.all.map{|industry| {id: industry.id, description: industry.description}}
  end

  def employees_range_values
    EmployeesRange.all.map{|employees_range| {id: employees_range.id, description: employees_range.description}}
  end

  def form_info
    {
      title: 'Empecemos por conocernos',
      subtitle: 'Brinda a tu candidato información de tu empresa.',
      form: {
        buttons: {
          submit: 'Siguiente',
          prev: '',
          next: ''
        },
        action: Rails.application.routes.url_helpers.companies_first_offer_step_one_path,
        method: 'PUT',
        type: 'company',
        formFields: {
          name: {
            name: 'company[name]',
            label: 'Nombre empresa o Razón social*'
          },
          industry_id: {
            name: 'company[industry_id]',
            label: 'Sector al que pertenece tu empresa*',
            values: industries_values
          },
          contact_work_position: {
            name: 'company[contact_work_position]',
            label: 'Cargo'
          },
          contact_name: {
            name: 'company[contact_name]',
            label: 'Persona de contacto'
          },
          contact_cellphone: {
            name: 'company[contact_cellphone]',
            label: 'Número de contacto'
          },
          employees_range_id: {
            name: 'company[employees_range_id]',
            label: 'Número de empleados',
            values: employees_range_values
          }
        }
      }
    }
  end
end
