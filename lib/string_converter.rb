module StringConverter
  def self.capitalize_text(text = "")
    text.split.map(&:capitalize).map {|word| capitalize_acronym(word)}.join(' ')
  end

  def self.capitalize_acronym(text = "")
    (text.include?(".")) ? "#{text.split(".").map(&:capitalize).join('.')}." : text
  end
end
