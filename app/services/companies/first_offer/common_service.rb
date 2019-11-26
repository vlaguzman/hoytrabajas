module Companies::FirstOffer::CommonService

  def self.update_source(source = nil, update_params = {})
    if source.update(update_params)
      { status: :ok, data: source }
    else
      { status: :error, data: source }
    end
  end

end