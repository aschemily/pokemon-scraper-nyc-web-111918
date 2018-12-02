class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []
  
  def self.all 
   sql = <<-SQL
      SELECT *
      FROM pokemon
    SQL
    
    db[:conn].execute(sql).map do |row|
      self.new_from_db(row)
      
    end 
    
  end 
  
  def initialize (keyword)
    # @id = id 
    # @name = name 
    # @type = type 
    # @db = db
    
    @@all << self 
    end 
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", name, type)
  end 
  
  def self.find(id, db)
     sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
      LIMIT 1
    SQL
    
    db[:conn].execute(sql, id).map do |row|
      self.new_from_db(row)
    end.first 
  end 
    
end
