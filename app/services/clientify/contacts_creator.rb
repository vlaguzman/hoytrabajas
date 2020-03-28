class Clientify::ContactsCreator
  
  def self.call(token=nil, contact_source=nil)
    @data_manager = Clientify::DataManager.new(token)
    contacts_response = @data_manager.get_contacts contact_source
    hash_contacts = JSON.parse contacts_response.gsub('\:', ':')
    hash_contacts['results'].each{|contact| create_contact contact}
  end

  private 

  def self.create_contact contact
    tags_response = @data_manager.get_contact_tags contact["id"]
    hash_tags = JSON.parse tags_response.gsub('\:', ':')
    tags = hash_tags['results'].map{|result| result['name']}
    create_candidate contact if tags.include?(Clientify::DataManager::CONTACT_CANDIDATE_TAG)
    create_company contact if tags.include?(Clientify::DataManager::CONTACT_COMPANY_TAG)
  end

  def self.create_company resource
    Company.create(name: resource["company_name"],
                   contact_name: resource["name"],
                   email: resource["emails"][0]["email"],
                   password: resource["id"])
  end

  def self.create_candidate resource
    User.create(name: resource["first_name"],
                email: resource["emails"][0]["email"],
                password: resource["id"])
  end
end
