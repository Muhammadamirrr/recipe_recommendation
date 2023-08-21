# frozen_string_literal: true

class JSONErrorHandler
  def self.handle_error(error)
    case error
    when Errno::ENOENT
      handle_file_not_found(error)
    when JSON::ParserError
      handle_json_parsing_error(error)
    else
      handle_generic_error(error)
    end
  end

  def self.handle_file_not_found(error)
    puts "File not found: #{error.message}"
  end

  def self.handle_json_parsing_error(error)
    puts "Error parsing JSON: #{error.message}"
  end

  def self.handle_generic_error(error)
    puts "An error occurred: #{error.message}"
  end
end
