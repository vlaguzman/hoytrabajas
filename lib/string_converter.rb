module StringConverter
  def self.capitalize_text(text = "")
    text.split.map(&:capitalize)
      .map { |word| capitalize_acronym( word ) }
      .map { |word| capitalize_acronym( word, split_param: "-" ) }
      .join(' ')
  end

  def self.capitalize_acronym(text = "", split_param: ".")
    (text.include?(split_param)) ? "#{ text.split(split_param).map(&:capitalize).join(split_param) }" : text
  end

  def self.replace_chars_to(text, char_to_replace: " ", new_char: " ")
    text.split(char_to_replace).join(new_char)
  end
end
