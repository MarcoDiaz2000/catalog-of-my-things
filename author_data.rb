# author_data.rb

require 'json'
require_relative 'author'

class AuthorData
  def self.path
    './Data/authors.json'
  end

  def self.save_data(authors)
    authors_data = authors.map do |author|
      { first_name: author.first_name, last_name: author.last_name }
    end
    File.write(AuthorData.path, JSON.generate(authors_data))
    puts 'Authors saved successfully.'
  end

  def self.read_data
    return [] unless File.exist?(AuthorData.path)

    begin
      JSON.parse(File.read(AuthorData.path)).map do |obj|
        Author.new(obj['first_name'], obj['last_name'])
      end
    rescue JSON::ParserError
      puts "Error: Invalid JSON data in #{AuthorData.path}."
      []
    end
  end
end
