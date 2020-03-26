class AffinityPercentages::ExecuteUpdateWorker
  include Sidekiq::Worker

  sidekiq_options queue: :affinitypercentage, retry: false

  def perform(curriculum_vitae_id)
    AffinityPercentages::ExecuteWorkerService.(curriculum_vitae_id)
  end

end
