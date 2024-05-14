class DogCeo::Client
  class BreedNotFound < StandardError; end

  include HTTParty

  base_uri "https://dog.ceo/api"

  def random_image_by_breed(breed)
    url = "/breed/#{breed.parameterize}/images/random"
    Rails.logger.info("Fetching random image from: #{url}")
    response = self.class.get(url)
    # if the breed is not found, raise an exception (own exception class)
    raise BreedNotFound.new(breed) unless response.success?
    response
  end
end
