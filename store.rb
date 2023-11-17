require 'json'

class Store
  def initialize(variable)
    @variable = variable
  end

  def to_json(*_args)
    case @variable
    when :student
      {
        JSON.create_id => self.class.name,
        'id' => @id,
        'name' => @name,
        'age' => @age,
        'parent_permission' => @parent_permission,
        'classroom' => @classroom
      }.to_json(*_args)
    when :teacher
      {
        JSON.create_id => self.class.name,
        'id' => @id,
        'name' => @name,
        'age' => @age,
        'parent_permission' => @parent_permission,
        'specialization' => @specialization
      }.to_json(*_args)
    when :book
      {
        JSON.create_id => self.class.name,
        'id' => @id,
        'title' => @title,
        'author' => @author,
        'rentals' => @rentals
      }.to_json(*_args)
    when :rental
      {
        JSON.create_id => self.class.name,
        'date' => @date,
        'person' => @person,
        'book' => @book
      }.to_json(*_args)
    else
      {}.to_json(*_args)
    end
  end

  def self.json_create(object)
    case object[JSON.create_id]
    when 'Student'
      new(:student).tap do |store|
        store.instance_variable_set(:@id, object['id'])
        store.instance_variable_set(:@name, object['name'])
        store.instance_variable_set(:@age, object['age'])
        store.instance_variable_set(:@parent_permission, object['parent_permission'])
        store.instance_variable_set(:@classroom, object['classroom'])
      end
    when 'Teacher'
      new(:teacher).tap do |store|
        store.instance_variable_set(:@id, object['id'])
        store.instance_variable_set(:@name, object['name'])
        store.instance_variable_set(:@age, object['age'])
        store.instance_variable_set(:@parent_permission, object['parent_permission'])
        store.instance_variable_set(:@specialization, object['specialization'])
      end
    when 'Book'
      new(:book).tap do |store|
        store.instance_variable_set(:@id, object['id'])
        store.instance_variable_set(:@title, object['title'])
        store.instance_variable_set(:@author, object['author'])
        store.instance_variable_set(:@rentals, object['rentals'])
      end
    when 'Rental'
      new(:rental).tap do |store|
        store.instance_variable_set(:@date, object['date'])
        store.instance_variable_set(:@person, object['person'])
        store.instance_variable_set(:@book, object['book'])
      end
    else
      new(:unknown)
    end
  end
end
