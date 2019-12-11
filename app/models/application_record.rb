class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def rescue_record(object, method, param)
    klass = object.constantize
    begin
      klass.send(method, param)
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end

end
