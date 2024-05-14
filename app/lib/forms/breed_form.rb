class Forms::BreedForm
  include ActiveModel::Validations, ActiveModel::Conversion

  attr_reader :name

  validates :name, presence: true

  def initialize(params = {})
    @name = params[:name]
  end
end
