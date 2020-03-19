require 'rails_helper'

RSpec.describe Elasticsearch::Offers::Queries do

  #Cities
  let(:bogota) { create(:city) }
  let(:medellin) { create(:city) }

  #Job Categories
  let(:tech_category) { create(:job_category) }
  let(:cook_category) { create(:job_category) }

  #Work Modes
  let(:remote_mode) { create(:work_mode) }
  let(:fixed_mode) { create(:work_mode) }

  #Contract Types
  let(:service_provision) { create(:contract_type) }
  let(:indefinite_contract) { create(:contract_type) }

  #Available work days
  let(:monday) { create(:available_work_day) }
  let(:friday) { create(:available_work_day) }

  #Working days
  let(:morning) { create(:working_day) }
  let(:late) { create(:working_day) }

  #JobAids
  let(:transport) { create(:job_aid) }

  #Languages
  let(:spanish) { create(:language) }
  let(:english) { create(:language) }
  let(:german) { create(:language) }

  let(:request_parameters) { Hash.new }

  describe "#clauses_groups_builder" do
    context "When method is used" do
      it "Should return the expected object" do
        expected_object = {
          filter: [:city, :job_categories, :work_mode, :contract_type, :available_work_days, :working_days, :job_aids, :languages],
          multimatch: [:keywords],
          must: [:id, :status],
          must_not: [],
          should: [],
        }

        response = subject.clauses_groups_builder

        expect(response).to eq(expected_object)
      end
    end
  end

  describe "#call" do
    describe "Recibe request parameters" do

      context "When parametes are empty" do
        it "Should return the expected object" do
          expected_object = {:query => {:match_all=>{}}}

          expect(subject.(request_parameters: request_parameters)).to eq(expected_object)
        end
      end

      context "when multimatch param is present" do
        let(:request_parameters) do
          {
            city: [bogota.id, medellin.id],
            keywords: "desarrollador ruby on rails"
          }
        end

        it "should return the expected object" do
          response = subject.(request_parameters: request_parameters)

          expected_object = {:query=>
            {:bool=>
              {:filter=>
                [{:nested=>
                  {:path=>"city",
                    :query=>
                    {:bool=>
                      {:should=>
                        [{:match=>{"city.id"=>bogota.id}}, {:match=>{"city.id"=>medellin.id}}]}}}}],
              :must=>
                [{:multi_match=>
                  {:query=>"desarrollador ruby on rails",
                    :fields=>["description^3", "title^1"]}}]}}}

          expect(response).to eq(expected_object)
        end
      end

      context "When the parameters have the city param" do
        let(:request_parameters) do
          {
            city: [bogota.id, medellin.id]
          }
        end

        it "should return the expected object" do
          response = subject.(request_parameters: request_parameters)

          expected_object = {
            query: {
              bool: {
                filter:[
                  {nested: {
                    path: "city",
                    query: {
                      bool: {
                        should:[
                          { match: { "city.id"=> bogota.id } },
                          { match: { "city.id"=> medellin.id } }
                        ]
                      }
                    }}
                  }
                ]
              }
            }
          }

          expect(response).to eq(expected_object)
        end
      end

      context "When the parameters have the city and job categories param" do
        let(:request_parameters) do
          {
            city: [bogota.id, medellin.id],
            job_categories: [tech_category.id, cook_category.id]
          }
        end

        it "should return the expected object" do
          response = subject.(request_parameters: request_parameters)

          expected_object = {
            query: {
              bool: {
                filter:[
                  {nested: {
                    path: "city",
                    query: {
                      bool: {
                        should:[
                          { match: { "city.id"=> bogota.id } },
                          { match: { "city.id"=> medellin.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "job_categories",
                    query: {
                      bool: {
                        should:[
                          { match: { "job_categories.id"=> tech_category.id } },
                          { match: { "job_categories.id"=> cook_category.id } }
                        ]
                      }
                    }}
                  }
                ]
              }
            }
          }

          expect(response).to eq(expected_object)
        end
      end

      #TODO Oscar When the age change to a age range
      #context "when the parameters have the city, job categories and age" do
      #end

      #TODO Oscar When the experience change to the experience range
      #context "when the parameters have the city, job categories, age and experience" do
      #end

      context "when the parameters have the city, job categories and work mode" do
        let(:request_parameters) do
          {
            city: [bogota.id, medellin.id],
            job_categories: [tech_category.id, cook_category.id],
            work_mode: [ remote_mode.id, fixed_mode.id ]
          }
        end

        it "should return the expected object" do
          response = subject.(request_parameters: request_parameters)

          expected_object = {
            query: {
              bool: {
                filter:[
                  {nested: {
                    path: "city",
                    query: {
                      bool: {
                        should:[
                          { match: { "city.id"=> bogota.id } },
                          { match: { "city.id"=> medellin.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "job_categories",
                    query: {
                      bool: {
                        should:[
                          { match: { "job_categories.id"=> tech_category.id } },
                          { match: { "job_categories.id"=> cook_category.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "work_mode",
                    query: {
                      bool: {
                        should:[
                          { match: { "work_mode.id"=> remote_mode.id } },
                          { match: { "work_mode.id"=> fixed_mode.id } }
                        ]
                      }
                    }}
                  }
                ]
              }
            }
          }

          expect(response).to eq(expected_object)
        end
      end

      context "when the parameters have the city, job categories, work mode and contract type" do
        let(:request_parameters) do
          {
            city: [bogota.id, medellin.id],
            job_categories: [tech_category.id, cook_category.id],
            work_mode: [ remote_mode.id, fixed_mode.id ],
            contract_type: [service_provision.id, indefinite_contract.id ]
          }
        end

        it "should return the expected object" do
          response = subject.(request_parameters: request_parameters)

          expected_object = {
            query: {
              bool: {
                filter:[
                  {nested: {
                    path: "city",
                    query: {
                      bool: {
                        should:[
                          { match: { "city.id"=> bogota.id } },
                          { match: { "city.id"=> medellin.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "job_categories",
                    query: {
                      bool: {
                        should:[
                          { match: { "job_categories.id"=> tech_category.id } },
                          { match: { "job_categories.id"=> cook_category.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "work_mode",
                    query: {
                      bool: {
                        should:[
                          { match: { "work_mode.id"=> remote_mode.id } },
                          { match: { "work_mode.id"=> fixed_mode.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "contract_type",
                    query: {
                      bool: {
                        should:[
                          { match: { "contract_type.id"=> service_provision.id } },
                          { match: { "contract_type.id"=> indefinite_contract.id } }
                        ]
                      }
                    }}
                  }
                ]
              }
            }
          }

          expect(response).to eq(expected_object)
        end
      end

      context "when the parameters have the city, job categories, work mode, contract type and available work days" do
        let(:request_parameters) do
          {
            city: [bogota.id, medellin.id],
            job_categories: [tech_category.id, cook_category.id],
            work_mode: [ remote_mode.id, fixed_mode.id ],
            contract_type: [service_provision.id, indefinite_contract.id ],
            available_work_days: [monday.id, friday.id]
          }
        end

        it "should return the expected object" do
          response = subject.(request_parameters: request_parameters)

          expected_object = {
            query: {
              bool: {
                filter:[
                  {nested: {
                    path: "city",
                    query: {
                      bool: {
                        should:[
                          { match: { "city.id"=> bogota.id } },
                          { match: { "city.id"=> medellin.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "job_categories",
                    query: {
                      bool: {
                        should:[
                          { match: { "job_categories.id"=> tech_category.id } },
                          { match: { "job_categories.id"=> cook_category.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "work_mode",
                    query: {
                      bool: {
                        should:[
                          { match: { "work_mode.id"=> remote_mode.id } },
                          { match: { "work_mode.id"=> fixed_mode.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "contract_type",
                    query: {
                      bool: {
                        should:[
                          { match: { "contract_type.id"=> service_provision.id } },
                          { match: { "contract_type.id"=> indefinite_contract.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "available_work_days",
                    query: {
                      bool: {
                        should:[
                          { match: { "available_work_days.id"=> monday.id } },
                          { match: { "available_work_days.id"=> friday.id } }
                        ]
                      }
                    }}
                  }
                ]
              }
            }
          }

          expect(response).to eq(expected_object)
        end
      end

      context "when the parameters have the city, job categories, work mode, contract type, available work days and working days" do
        let(:request_parameters) do
          {
            city: [bogota.id, medellin.id],
            job_categories: [tech_category.id, cook_category.id],
            work_mode: [ remote_mode.id, fixed_mode.id ],
            contract_type: [service_provision.id, indefinite_contract.id ],
            available_work_days: [monday.id, friday.id],
            working_days: [morning.id, late.id]
          }
        end

        it "should return the expected object" do
          response = subject.(request_parameters: request_parameters)

          expected_object = {
            query: {
              bool: {
                filter:[
                  {nested: {
                    path: "city",
                    query: {
                      bool: {
                        should:[
                          { match: { "city.id"=> bogota.id } },
                          { match: { "city.id"=> medellin.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "job_categories",
                    query: {
                      bool: {
                        should:[
                          { match: { "job_categories.id"=> tech_category.id } },
                          { match: { "job_categories.id"=> cook_category.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "work_mode",
                    query: {
                      bool: {
                        should:[
                          { match: { "work_mode.id"=> remote_mode.id } },
                          { match: { "work_mode.id"=> fixed_mode.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "contract_type",
                    query: {
                      bool: {
                        should:[
                          { match: { "contract_type.id"=> service_provision.id } },
                          { match: { "contract_type.id"=> indefinite_contract.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "available_work_days",
                    query: {
                      bool: {
                        should:[
                          { match: { "available_work_days.id"=> monday.id } },
                          { match: { "available_work_days.id"=> friday.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "working_days",
                    query: {
                      bool: {
                        should:[
                          { match: { "working_days.id"=> morning.id } },
                          { match: { "working_days.id"=> late.id } }
                        ]
                      }
                    }}
                  }
                ]
              }
            }
          }

          expect(response).to eq(expected_object)
        end
      end

      context "when the parameters have the city, job categories, work mode, contract type, available work days, working days and job aids" do
        let(:request_parameters) do
          {
            city: [bogota.id, medellin.id],
            job_categories: [tech_category.id, cook_category.id],
            work_mode: [ remote_mode.id, fixed_mode.id ],
            contract_type: [service_provision.id, indefinite_contract.id ],
            available_work_days: [monday.id, friday.id],
            working_days: [morning.id, late.id],
            job_aids: transport.id
          }
        end

        it "should return the expected object" do
          response = subject.(request_parameters: request_parameters)

          expected_object = {
            query: {
              bool: {
                filter:[
                  {nested: {
                    path: "city",
                    query: {
                      bool: {
                        should:[
                          { match: { "city.id"=> bogota.id } },
                          { match: { "city.id"=> medellin.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "job_categories",
                    query: {
                      bool: {
                        should:[
                          { match: { "job_categories.id"=> tech_category.id } },
                          { match: { "job_categories.id"=> cook_category.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "work_mode",
                    query: {
                      bool: {
                        should:[
                          { match: { "work_mode.id"=> remote_mode.id } },
                          { match: { "work_mode.id"=> fixed_mode.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "contract_type",
                    query: {
                      bool: {
                        should:[
                          { match: { "contract_type.id"=> service_provision.id } },
                          { match: { "contract_type.id"=> indefinite_contract.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "available_work_days",
                    query: {
                      bool: {
                        should:[
                          { match: { "available_work_days.id"=> monday.id } },
                          { match: { "available_work_days.id"=> friday.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "working_days",
                    query: {
                      bool: {
                        should:[
                          { match: { "working_days.id"=> morning.id } },
                          { match: { "working_days.id"=> late.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "job_aids",
                    query: {
                      bool: {
                        should:[
                          { match: { "job_aids.id"=> transport.id } }
                        ]
                      }
                    }}
                  }
                ]
              }
            }
          }

          expect(response).to eq(expected_object)
        end
      end

      context "when the parameters have the city, job categories, work mode, contract type, available work days, working days andm aids and languages" do
        let(:request_parameters) do
          {
            city: [bogota.id, medellin.id],
            job_categories: [tech_category.id, cook_category.id],
            work_mode: [ remote_mode.id, fixed_mode.id ],
            contract_type: [service_provision.id, indefinite_contract.id ],
            available_work_days: [monday.id, friday.id],
            working_days: [morning.id, late.id],
            job_aids: transport.id,
            languages: [spanish.id, english.id, german.id]
          }
        end

        it "should return the expected object" do
          response = subject.(request_parameters: request_parameters)

          expected_object = {
            query: {
              bool: {
                filter:[
                  {nested: {
                    path: "city",
                    query: {
                      bool: {
                        should:[
                          { match: { "city.id"=> bogota.id } },
                          { match: { "city.id"=> medellin.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "job_categories",
                    query: {
                      bool: {
                        should:[
                          { match: { "job_categories.id"=> tech_category.id } },
                          { match: { "job_categories.id"=> cook_category.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "work_mode",
                    query: {
                      bool: {
                        should:[
                          { match: { "work_mode.id"=> remote_mode.id } },
                          { match: { "work_mode.id"=> fixed_mode.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "contract_type",
                    query: {
                      bool: {
                        should:[
                          { match: { "contract_type.id"=> service_provision.id } },
                          { match: { "contract_type.id"=> indefinite_contract.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "available_work_days",
                    query: {
                      bool: {
                        should:[
                          { match: { "available_work_days.id"=> monday.id } },
                          { match: { "available_work_days.id"=> friday.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "working_days",
                    query: {
                      bool: {
                        should:[
                          { match: { "working_days.id"=> morning.id } },
                          { match: { "working_days.id"=> late.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "job_aids",
                    query: {
                      bool: {
                        should:[
                          { match: { "job_aids.id"=> transport.id } }
                        ]
                      }
                    }}
                  },
                  {nested: {
                    path: "languages",
                    query: {
                      bool: {
                        should:[
                          { match: { "languages.id"=> spanish.id } },
                          { match: { "languages.id"=> english.id } },
                          { match: { "languages.id"=> german.id } }
                        ]
                      }
                    }}
                  }
                ]
              }
            }
          }

          expect(response).to eq(expected_object)
        end
      end
    end
  end

end