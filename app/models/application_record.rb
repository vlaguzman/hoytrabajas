class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def rescue_record(record, ar_method, param)
    klass = record.constantize
    begin
      klass.send(ar_method, param)
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end

end
