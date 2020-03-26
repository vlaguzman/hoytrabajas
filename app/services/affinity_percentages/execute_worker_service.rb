module AffinityPercentages::ExecuteWorkerService

  def self.call(curriculum_vitae_id)
    cv_record = CurriculumVitae.find_by(id: curriculum_vitae_id)

    affinity_percentages = cv_record && cv_record.affinity_percentages

    update_affinities(affinity_percentages) if affinity_percentages.present?
  end

  def self.update_affinities(affinity_percentages)
    affinity_percentages.map do |affinity|
      AffinityPercentages::UpdateAffinityPercentagesService.new.update_affinity(affinity, :cv_and_user_updated)
    end
  end

end
