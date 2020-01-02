module Cities::CitiesWithOffersListService

  def self.call
    Offer
      .pluck(:city_id)
      .uniq
      .compact
      .map {|id| City.find_by(id: id) }
      .map { |city| {label: city.description, value: city.id} }
  end

end