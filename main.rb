# main.rb

require_relative 'item'

class Main
  def initialize
    @items = []
  end

  def start
    puts "Welcome to the Catalog Management App!"
    loop do
      display_menu
      choice = get_user_choice

      case choice
      when 1
        create_item
      when 2
        move_item_to_archive
      when 3
        list_items
      when 4
        puts "Thank you for using the Catalog Management App. Goodbye!"
        break
      else
        puts "Invalid choice. Please try again."
      end
    end
  end

  private

  def display_menu
    puts "\nOptions:"
    puts "1. Create an item"
    puts "2. Move an item to the archive"
    puts "3. List all items"
    puts "4. Quit"
  end

  def get_user_choice
    print "\nEnter your choice: "
    gets.chomp.to_i
  end

  def create_item
    print "Enter the published date (YYYY-MM-DD): "
    published_date = gets.chomp
    item = Item.new(published_date)
    
    # Ask for genre, author, source, and label values, and set them using custom setters.
    # For simplicity, let's assume these are strings.
    print "Enter the genre: "
    item.genre = gets.chomp

    print "Enter the author: "
    item.author = gets.chomp

    print "Enter the source: "
    item.source = gets.chomp

    print "Enter the label: "
    item.label = gets.chomp

    @items << item
    puts "Item created successfully!"
  end

  def move_item_to_archive
    list_items
    print "Enter the ID of the item you want to move to the archive: "
    item_id = gets.chomp.to_i

    item = @items.find { |item| item.id == item_id }

    if item.nil?
      puts "Item with ID #{item_id} not found."
    else
      item.move_to_archive
      puts "Item with ID #{item_id} moved to the archive."
    end
  end

  def list_items
    if @items.empty?
      puts "No items found."
    else
      puts "ID\tPublished Date\t\tGenre\t\tAuthor\t\tSource\t\tLabel\t\tArchived"
      @items.each do |item|
        puts "#{item.id}\t#{item.published_date}\t#{item.genre}\t#{item.author}\t#{item.source}\t#{item.label}\t#{item.archived}"
      end
    end
  end
end

# Start the app
app = Main.new
app.start
