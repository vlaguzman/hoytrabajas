module ExtraHashMethods
  def without(*keys)
    dup.without!(*keys)
  end

  def without!(*keys)
    reject! { |key| keys.include?(key) }
  end
end

Hash.class_eval { include ExtraHashMethods }