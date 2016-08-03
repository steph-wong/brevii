
  # Responsible for authenticating Enceladus and fetching the account configuration.
  # This method hits the following TMDb endpoints:
  # - https://api.themoviedb.org/3/configuration
  #
  # You can also provide the following optional arguments:
  # - include_image_language: find backdrops and posters in a specific language (check out http://docs.themoviedb.apiary.io session: Image Languages)
  # - include_adult: includes adult movies in searchers
  #
  # Examples:
  #
  #   Enceladus.connect("0f76454c7b22300e457800cc20f24ae9")
  #   Enceladus.connect("0f76454c7b22300e457800cc20f24ae9", { include_image_language: "pt-BR" })
  #
  def self.connect(api_key, options={ include_image_language: "en", include_adult: false })
    Enceladus::Configuration::Api.instance.tap do |api|
      api.connect(api_key)
      api.include_adult = options[:include_adult]
    end
    Enceladus::Configuration::Image.instance.include_image_language = options[:include_image_language]
  end
