module RoutesService

  def self.build_path( *args)
    path = args
      .map { |word| I18n.t("routes.#{word}") }
      .join("/")
    "/#{path}"
  end

end