class Pet
  attr_accessor :name, :id

  def initialize(name, id = nil)
    @name = name
    @id = id
  end

  def save
    # we need to take the name and create a record for the pet
    sql = <<-SQL
      INSERT into pets (name) VALUES (?);
    SQL
    
    DB.execute(sql, self.name)

    self.id = DB.execute("SELECT id FROM pets ORDER BY id DESC")[0][0]
  end

  def self.create(name)
    self.new(name).tap{ |p| p.save }
  end

  def self.delete(id)
   sql = <<-SQL
    DELETE FROM pets WHERE id = (?)
   SQL

   DB.execute(sql, id)
  end

  def self.search_by_name(term)
    sql = <<-SQL
      SELECT * FROM pets WHERE LOWER(name) LIKE (?)
    SQL

    mapped_array = DB.execute(sql, "%#{term.downcase}%").map do |row|
      self.new(row[1], row[0])
    end
  end

  def self.all
    DB.execute("SELECT * FROM pets").map do |row|
      id = row[0]
      name = row[1]
      self.new(name, id)
    end
  end
end