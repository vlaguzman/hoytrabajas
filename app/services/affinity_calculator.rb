module AffinityCalculator

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

  def self.not_nil_attributes_to_compare(klass, object)
    not_nil_att = []
    klass.attributes_to_compare.each do |att|
      not_nil_att << [att, object.send(att)] if object.send(att).present?
    end
    not_nil_att.to_h
  end

  def self.not_empty_lists_to_compare(klass, object)
    not_empty_lists = []
    klass.lists_to_compare.each do |att|
      not_empty_lists << [att, object.send(att)] if object.send(att).any?
    end
    not_empty_lists.to_h
  end
 
end
