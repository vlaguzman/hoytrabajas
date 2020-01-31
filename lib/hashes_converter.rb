module HashesConverter
  def self.sanitize_array_values(hash: {}, split_character: ",")
    with_array_values = hash.select { |key, value| value.class.eql?(Array) && value[0].class.eql?(String) }

    hash.merge(
      with_array_values
        .transform_values { |value_hash| value_hash
          .map{ |value| value.split(split_character) }
          .flatten
          .map(&:to_i)
        }
    )
  end

  def self.validate_presence_values(object={})
    object.delete_if { |_, value| not value.present? }
  end

  def self.select_if_values_presence(hash)
    hash.select { |key, value| value.present? }
  end
end
