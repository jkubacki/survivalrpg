class Draw

  def initialize(risk)
    @risk = risk.to_i
  end

  def call
    {
      place: draw_place,
      encounters: draw_encounters(@risk)
    }
  end

  private

  def draw_place
    points = Place.sum(:frequency)
    random_point = rand(1..points)

    current_point = 0
    Place.all.each do |place|
      current_point += place.frequency
      return place if random_point <= current_point
    end
  end

  def draw_encounters(risk)
    id = Encounter.pluck(:id).sample(encounter_count(risk))
    Encounter.find(id)
  end

  def encounter_count(risk)
    rand(0..1) + rand(0..risk)
  end
end
