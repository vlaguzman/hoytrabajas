class Home::HomePresenter < ApplicationPresenter

  def self.data_filter
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
            { label: 'text', value: 'test' },
            { label: 'text', value: 'test' },
            { label: 'text', value: 'test' }
          ]
        },
        {
          type: 'select',
          label: 'Rango Salarial',
          name: 'pay',
          aux: [
            { label: 'text', value: 'test' },
            { label: 'text', value: 'test' },
            { label: 'text', value: 'test' }
          ]
        }
      ],
      button1: 'Categories'
    }
  end

  def self.offers
    OffersService.active_offers_index_details
  end
end
