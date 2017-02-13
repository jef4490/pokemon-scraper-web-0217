class Pokemon

  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize(db:, id:, name:, type:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
    # @hp = hp
    # binding.pry
  end

  def self.save(poke_name, poke_type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES ('#{poke_name}', '#{poke_type}');")
  end

  def self.find(key, db)
  pokemon_table = db.execute("SELECT * FROM pokemon WHERE id = #{key}").first
  # binding.pry
  pokemon = Pokemon.new(db: db, id: pokemon_table[0], name: pokemon_table[1], type: pokemon_table[2])
  if pokemon_table.length > 3
    pokemon.hp = pokemon_table.last
  end
  # binding.pry
  pokemon
  end

  def alter_hp(new_hp, db)
    # binding.pry
    db.execute("UPDATE pokemon
    SET hp=#{new_hp} WHERE id=#{self.id};")
  end

end
