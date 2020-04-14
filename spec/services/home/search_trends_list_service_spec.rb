require 'rails_helper'

RSpec.describe Home::SearchTrendsListService do

  let!(:cities) do
    [
      create(:city, description: 'Bogotá'),
      create(:city, description: 'Medellín'),
      create(:city, description: 'Bucaramanga'),
      create(:city, description: 'Santa Marta'),
      create(:city, description: 'Villavicencio')
    ]
  end

  let!(:job_categories) do
    [
      create(:job_category, description: 'Gestión administrativa'),
      create(:job_category, description: 'Ventas y comercial'),
      create(:job_category, description: 'Operario'),
      create(:job_category, description: 'Tecnología y programación'),
      create(:job_category, description: 'Cocina, bar y meseros')
    ]
  end

  let!(:work_positions) do
    [
      create(:work_position, description: 'Auxiliar Logístico'),
      create(:work_position, description: 'Diseñador Gráfico'),
      create(:work_position, description: 'Mensajero'),
      create(:work_position, description: 'Community Manager'),
      create(:work_position, description: 'Auxiliar Contable')
    ]
  end

  let!(:contract_types) do
    [
      create(:contract_type, description: "Término indefinido"),
      create(:contract_type, description: "Prestación de servicios"),
      create(:contract_type, description: "Temporal"),
      create(:contract_type, description: "De aprendizaje")
    ]
  end

  let!(:working_days) do
    [
      create(:working_day, description: 'Mañana (7am-12pm)'),
      create(:working_day, description: 'Tarde (12pm-5pm)'),
      create(:working_day, description: 'Media tarde (5pm-10pm)'),
      create(:working_day, description: 'Noche (10pm-3am)')
    ]
  end

  describe "constants" do
    it "should return the expected array ids" do
      expeted_array = [:city, :job_categories, :work_position, :contract_type, :working_days]

      expect(subject::DEFAULT_SEARCH_PARAMS.keys).to match_array(expeted_array)
    end
  end

  describe "#call" do
    context "when is called" do
      it "should return a expected array with expected values" do
        response = subject.()

        expected_object = {
          :city=>[
            {:id=>cities[0].id, :description=>"Bogotá"},
            {:id=>cities[1].id, :description=>"Medellín"},
            {:id=>cities[2].id, :description=>"Bucaramanga"},
            {:id=>cities[3].id, :description=>"Santa Marta"},
            {:id=>cities[4].id, :description=>"Villavicencio"}],
          :job_categories=>[
            {:id=>job_categories[0].id, :description=>"Gestión administrativa"},
            {:id=>job_categories[1].id, :description=>"Ventas y comercial"},
            {:id=>job_categories[2].id, :description=>"Operario"},
            {:id=>job_categories[3].id, :description=>"Tecnología y programación"},
            {:id=>job_categories[4].id, :description=>"Cocina, bar y meseros"}],
          :work_position=>[
            {:id=>work_positions[0].id, :description=>"Auxiliar Logístico"},
            {:id=>work_positions[1].id, :description=>"Diseñador Gráfico"},
            {:id=>work_positions[2].id, :description=>"Mensajero"},
            {:id=>work_positions[3].id, :description=>"Community Manager"},
            {:id=>work_positions[4].id, :description=>"Auxiliar Contable"}],
          :contract_type=>[
            {:id=>contract_types[0].id, :description=>"Término indefinido"},
            {:id=>contract_types[1].id, :description=>"Prestación de servicios"},
            {:id=>contract_types[2].id, :description=>"Temporal"},
            {:id=>contract_types[3].id, :description=>"De aprendizaje"}],
          :working_days=>[
            {:id=>working_days[0].id, :description=>"Mañana (7am-12pm)"},
            {:id=>working_days[1].id, :description=>"Tarde (12pm-5pm)"},
            {:id=>working_days[2].id, :description=>"Media tarde (5pm-10pm)"},
            {:id=>working_days[3].id, :description=>"Noche (10pm-3am)"}]
        }

        expect(response).to eq(expected_object)
      end
    end
  end
end