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
    encounters = []
    all_encounters = Encounter.all
    encounter_count(risk).times do
      encounters << draw_encounter(all_encounters)
    end
    encounters
  end

  def draw_encounter(all_encounters)
    points = 0
    all_encounters.each do |encounter|
      points += encounter.frequency
    end
    random_point = rand(1..points)
    current_point = 0
    all_encounters.each do |encounter|
      current_point += encounter.frequency
      if random_point <= current_point
        all_encounters = all_encounters.reject { |e| e == encounter }
        return encounter
      end
    end
  end

  def encounter_count(risk)
    rand(0..1) + rand(0..risk)
  end
end
