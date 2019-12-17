class AffinityCalculator

  # NOTES TO THE FINAL CALCULATE
  # CurriculumVitae has work_modes Offer has work mode
  # User has educational_degree Offer has educational_level (more than one)

  def initialize(offer, user)
    @offer = offer
    @user = user
  end

  def offer
    @offer
  end

  def user
    @user
  end

  def curriculum_vitae
    user.curriculum_vitae
  end

  def amount_offer_data(klass, object)
    not_nil_attributes_to_compare(klass, object).count
  end
  
  def calculate_total_equal_values
    total_equal_lists + total_equal_attributes
  end

  def total_equal_lists
    offer_hash = not_empty_lists_to_compare(Offer, offer)
    user_hash = not_empty_lists_to_compare(User, user)
    curriculum_vitae_hash = not_empty_lists_to_compare(CurriculumVitae, curriculum_vitae)
    total_equal_values = compare_hashes_count(offer_hash, user_hash)
    total_equal_values += compare_hashes_count(offer_hash, curriculum_vitae_hash)
  end

  def total_equal_attributes
    offer_hash = not_nil_attributes_to_compare(Offer, offer)
    user_hash = not_nil_attributes_to_compare(User, user)
    curriculum_vitae_hash = not_nil_attributes_to_compare(CurriculumVitae, curriculum_vitae)
    total_equal_values = compare_hashes_count(offer_hash, user_hash)
    total_equal_values += compare_hashes_count(offer_hash, curriculum_vitae_hash)
  end

  def not_nil_attributes_to_compare(klass, object)
    not_nil_att = []
    klass.attributes_to_compare.each do |att|
      not_nil_att << [att, object.send(att)] if object.send(att).present?
    end
    not_nil_att.to_h
  end

  def not_empty_lists_to_compare(klass, object)
    not_empty_lists = []
    klass.lists_to_compare.each do |att|
      not_empty_lists << [att, object.send(att)] if object.send(att).any?
    end
    not_empty_lists.to_h
  end

  private 

  def compare_hashes_count(hash, hash_b)
    cont = 0 
    hash.each{|k, v| cont += 1 if hash[k] == hash_b[k]}
    cont
  end
 
end
