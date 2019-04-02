class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    student_hash.each do
      |key, value| self.send(("#{key}="), value)
    end
    @@all << self
  end

  def self.create_from_collection(students_array)
    students_array.each do
      |student| self.new(student)
    end
  end

  def add_student_attributes(attributes_hash)
    student = self.class.all.detect {|x| x.name == attributes_hash[:name]}
    if student == nil
      self.class.new(attributes_hash)
    else
    attributes_hash.each do
      |key, value| student.send(("#{key}="), value) if student.key == nil
    end
    self
  end

  def self.all
    @@all
  end
end
