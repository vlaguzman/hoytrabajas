module AdminsService

  def self.remove_and_update(object, attributes)
    attributes.each do |attr|
      if attr[:password].blank? and attr[:password_confirmation].blank?
        attr.delete :password
        attr.delete :password_confirmation
      end
    end

    object.skip_reconfirmation!
    object.send :update, *attributes
  end

end