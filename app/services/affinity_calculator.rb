
class AffinityCalculator

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
    total_base = @offer_attr_hash.count + @offer_lists_hash.count
    total_eq_values = total_equal_values(@offer_lists_hash, @user_lists_hash, @cv_lists_hash) + 
                      total_equal_values(@offer_attr_hash, @user_attr_hash, @cv_attr_hash)
    (total_eq_values.to_f/total_base.to_f)*100
  end
  
  def total_equal_values(offer_hash, user_hash, cv_hash)
    HashesCompare.compare_hashes_count(offer_hash, user_hash) + HashesCompare.compare_hashes_count(offer_hash, cv_hash)
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

end
