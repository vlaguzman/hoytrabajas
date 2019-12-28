class Users::ProfilesPresenter < ApplicationPresenter

  def contact_number_with_format
    grouped_number = source
      .contact_number
      .to_s
      .match(/(\d{3})(\d{3})(\d{4})/)
    "#{grouped_number[1]} #{grouped_number[2]} #{grouped_number[3]}"
  end

end
