require_relative 'menu'
require_relative 'library_operations'

def main
  operations = LibraryOperations.new

  loop do
    print_menu
    selection = gets.chomp.to_i
    operations.execute_option(selection)
  end
end

main
