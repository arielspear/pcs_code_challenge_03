
class Parse

  def self.parse_names (prefixes, suffixes, name_string)

    parsed_name = {pre:"", first:"", middle:"", last:"", suffix:""}

    # get the last word and see if it's a suffix
    # if so, save as suffix and store the next to last word as last_name
    # otherwise store last word as last name

    word = name_string.split

    parsed_name[:suffix] = word.pop if suffixes.include? word.last

    parsed_name[:last] = word.pop
    
    # get first word and see if it's a prefix
    # if so, save as pre 
    # if there is a value remaining, set it as first

    parsed_name[:pre] = word.shift if prefixes.include? word.first
    
    parsed_name[:first] = word.shift if word.first

    parsed_name[:middle] = word.pop if word.first

    parsed_name.values

  end

end
