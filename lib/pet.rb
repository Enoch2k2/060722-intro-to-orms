class Pet
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap{ |p| p.save }
  end

  def self.delete(idx)
   self.all.delete_at(idx)
  end

  def self.search_by_name(term)
    self.all.select do |pet|
      pet.name.downcase.include?(term.downcase)
    end
  end

  def self.all
    @@all
  end
end