class Breed
  attr_reader :name, :url

  def initialize(name:, url:)
    @name = name
    @url = url
  end

  def Breed.lookup_for(name)
    Rails.logger.info("Looking up breed: #{name}")

    data = DogCeo::Client.new.random_image_by_breed(name)
    Rails.logger.debug("Data: #{data}")

    Breed.new(name: name, url: data['message'])
  end
end
