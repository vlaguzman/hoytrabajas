#Methods to compare hashes
module HashesCompare

#count how many values in the hashes are equal
  def self.compare_hashes_count(hash, hash_b)
    cont = 0
    hash.each{|k, v| cont += 1 if (v == hash_b[k] || any_equal_value?(v, hash_b[k]))}
    cont
  end

  private 

  def self.any_equal_value?(collection, collection_b)
    if is_a_collection?(collection_b)
      responses = collection_b.map { |v| collection.include?(v) }
      responses.include?(true)
    end
  end

  def self.is_a_collection?(value)
    (value.is_a? ActiveRecord::Associations::CollectionProxy) || (value.is_a? Array)
  end
end
