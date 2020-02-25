class AffinityCalculator

  VERSION = '1.0'

  ATTRIBUTE_WEIGHT = {
    available_work_days: 1,
    educational_degree:  3,
    educational_level:   1,
    driving_licences:    2,
    technical_skills:    2,
    contract_type_id:    2,
    to_learn_skills:     1,
    languages_list:      2,
    job_categories:      2,
    working_days:        1,
    work_mode_id:        1,
    soft_skills:         3,
    vehicles:            3,
    city_id:             3,
    sexes:               3
  }

  # NOTES TO THE FINAL CALCULATE
  # CurriculumVitae has work_modes Offer has work mode
  # User has educational_degree Offer has educational_level (more than one)

  attr_reader :offer, :user

  def initialize(offer, user)
    @offer = offer
    @user = user
    initialize_not_empty_to_compare_hashes
    initialize_not_nil_attributes_to_compare_hashes
  end

  def initialize_not_empty_to_compare_hashes
    @offer_lists_hash = not_empty_lists_to_compare(Offer, offer)
    @user_lists_hash = not_empty_lists_to_compare(User, user)
    @cv_lists_hash = not_empty_lists_to_compare(CurriculumVitae, user.curriculum_vitae)
  end

  def initialize_not_nil_attributes_to_compare_hashes
    @offer_attr_hash = not_nil_attributes_to_compare(Offer, offer)
    @user_attr_hash = not_nil_attributes_to_compare(User, user)
    @cv_attr_hash = not_nil_attributes_to_compare(CurriculumVitae, user.curriculum_vitae)
  end

  def affinity_percentage
    total_base = count_attributes(@offer_attr_hash) + count_attributes(@offer_lists_hash)
    total_eq_values = total_equal_values(@offer_lists_hash, @user_lists_hash, @cv_lists_hash) +
                      total_equal_values(@offer_attr_hash, @user_attr_hash, @cv_attr_hash)
    ((total_eq_values.to_f/total_base.to_f) * 100).round(0)
  end

  def total_equal_values(offer_hash, user_hash, cv_hash)
    HashesCompare.compare_hashes_count(offer_hash, user_hash, ATTRIBUTE_WEIGHT) + HashesCompare.compare_hashes_count(offer_hash, cv_hash, ATTRIBUTE_WEIGHT)
  end

  def not_nil_attributes_to_compare(klass, object)
    not_nil_att = []
    klass::ATTRIBUTES_TO_COMPARE.each do |att|
      not_nil_att << [att, object.send(att)] if object.send(att).present?
    end
    not_nil_att.to_h
  end

  def not_empty_lists_to_compare(klass, object)
    not_empty_lists = []
    klass::LISTS_TO_COMPARE.each do |att|
      not_empty_lists << [att, object.send(att)] if object.send(att).any?
    end
    not_empty_lists.to_h
  end

  private

  def count_attributes(hash)
    hash.inject(0) { |sum, key| sum + ATTRIBUTE_WEIGHT[key[0]] }
  end
end
