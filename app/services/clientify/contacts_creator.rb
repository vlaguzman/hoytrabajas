module Clientify::ContactsCreator

  PASSWORD_DEFAULT = ENV['CLIENTIFY_PASSWORD_DEFAULT']
  
  def self.call(token=nil, contact_source=nil)
    data_manager = Clientify::DataManager.new(token)
    contacts_response = data_manager.get_contacts contact_source
    hash_contacts = parse_response_to_json contacts_response
    hash_contacts['results'].each{|contact| create_contact data_manager, contact} if hash_contacts['results'].present?
  end

  private 

  def self.create_contact data_manager, contact
    tags_response = data_manager.get_contact_tags contact["id"]
    hash_tags = parse_response_to_json tags_response
    tags = hash_tags['results'].map{|result| result['name']}
    create_resource User, contact if tags.include?(Clientify::DataManager::CONTACT_CANDIDATE_TAG)
    create_resource Company, contact if tags.include?(Clientify::DataManager::CONTACT_COMPANY_TAG)
  end

  def self.create_resource klass, resource
    klass.create(name: first_name_or_company_name(klass, resource),
                 email: resource["emails"][0]["email"],
                 password: PASSWORD_DEFAULT,
                 clientify_contact_id: resource["id"])
  end

  def self.first_name_or_company_name klass, resource 
    (klass.is_a? User)? resource["first_name"] : resource["company_name"]
  end

  def self.parse_response_to_json response
    JSON.parse response.gsub('\:', ':')
  end
end
