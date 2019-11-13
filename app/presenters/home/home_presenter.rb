class Home::HomePresenter < ApplicationPresenter
  attr_accessor :current_user

  def initialize(current_user=nil)
    @current_user = current_user
  end

  def data_filter
    cities = ListConverter.model_list(City).map{ |value| {label: value.values.last, value: value.values.first} }
    {
      fields1: [
        { type: 'text', label: 'Palabra clave', name: 'q[title_cont]', id: 'keyword' },
        {
          type: 'select',
          label: 'Ciudad',
          name: 'q[id_count]',
          aux: cities
        },
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
      button1: 'Categories'
    }
  end

  def offers
    OffersService.active_offers_index_details(current_user)
  end
end
