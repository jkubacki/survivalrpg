class Draw

  def initialize(risk)
    @risk = risk
  end

  def call
    {
      place: draw_place,
      encounters: draw_encounters(@risk)
    }
  end

  private

  def draw_place
    id = Place.pluck(:id).sample
    Place.find(id)
  end

  def draw_encounters(risk)
    id = Encounter.pluck(:id).sample(encounter_count(risk))
    Encounter.find(id)
  end

  def encounter_count(risk)
    rand(0..1) + rand(0..risk)
  end
end
