class HomeController < ApplicationController
  def index
    @breed_form = Forms::BreedForm.new
  end

  def lookup
    @breed_form = Forms::BreedForm.new(form_params)
    # to make it a little bit more advanced I created a very simple form object
    if @breed_form.valid?
      @breed = Breed.lookup_for(@breed_form.name)
    else
      # render the index page with the form errors (that breed name is required)
      render :index
    end
  rescue DogCeo::Client::BreedNotFound
    # To handle if the breed is not found
    # for example, user entered a breed "12345"
    @breed_form.errors.add(:base, "Breed not found")
  rescue Socket::ResolutionError
    # To handle if something goes wrong with the network
    # for example host is not correct or any other network error
    @breed_form.errors.add(:base, "Network error")
  end

  private

  def form_params
    params.require(:forms_breed_form).permit(:name)
  end
end
