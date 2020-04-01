class Companies::ProfilesController < ApplicationController

  def show
    if  company_signed_in? && current_company.email == "test@empresa.com"
      @company = Companies::ProfilesPresenter.new(current_company, show_permit_params)
    else
      redirect_to companies_dashboard_path
    end
  end

  def update
    company = current_company
    Users::AttachFileService.upload_record_file(company, :logo, update_permit_params[:logo])
    company.errors.add(:logo, company.errors[:logo])
    @company = Companies::ProfilesPresenter.new(company)
    render 'show'
  end

  private

  def show_permit_params
    params.permit(:company_id)
  end

  def update_permit_params
    params
    .require(:company)
    .permit(:logo).to_h
  end
end
