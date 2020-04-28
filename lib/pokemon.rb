class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id 
    @name = name
    @type = type 
    @db = db 
  end 

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end 
  
  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    result = db.execute(sql, id)[0]
    Pokemon.new(id: result[0],name: result[1],type: result[2],db: result[3])
  end

end