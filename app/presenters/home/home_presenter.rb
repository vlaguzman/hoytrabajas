class Home::HomePresenter < ApplicationPresenter

  MAX_OFFER_LIMIT = 50

  attr_accessor :current_user

  def initialize(current_user = nil)
    @current_user = current_user
  end

  def data_filter
    cities = ListConverter.model_list(City).map{ |value| {label: value.values.last, value: value.values.first} }
    {
      fields1: [
        { type: 'text', label: 'Palabra clave', name: 'q[title_cont]', id: 'keyword' },
        {
          type: 'select',
          label: 'Tiempo',
          name: 'time',
          aux: [
          ]
        },
        {
          type: 'select',
          label: 'Rango Salarial',
          name: 'pay',
          aux: [
          ]
        }
      ],
      button1: 'Categories',
      cities: cities
    }
  end

  def offers
    OffersService.active_offers_index_details(current_user, MAX_OFFER_LIMIT)
  end

  def categories
    categories = JobCategory.all.map do |category|
      [
        ["img", "icon_job_category_id_#{category.id}.png"],
        ["id", category.id],
        ["name", category.description],
        ["quantity", category.offers.active.count]
      ].to_h
    end
    {
      categorias: categories
    }
  end
end
