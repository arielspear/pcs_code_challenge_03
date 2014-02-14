require 'pry'

# Read the command line argument and set up for
# either hunting prefixes or suffixes, like this:
case ARGV[0]

when '-p'

  # set up some regular expression for prefixes
  regex = /^\S*/
when '-s'
  # set up some regular expression for suffixes
  regex = /\S*$/
  else
  puts 'unknown option'
  puts 'usage: analyze.rb -p | -s < input_file > output_file'
  exit
end

histogram = Hash.new(0)

# throw away the command line option in ARGV so we can get to STDIN
ARGV.clear

# go through STDIN line by line
while line = gets
  # sets key to what regex grabs
  key = regex.match(line)

  # adds one to the value, so I have a counter of how many times
  # the same key appears and converts the match data to a symbol.
  histogram[key[0].to_sym] += 1

end
histogram = Hash[histogram.sort_by { |name, counter| counter }.reverse]

histogram.each { |name, counter| puts"#{name} #{counter}" }
# use the regular expression to find the right word
# count the word using a hash

# after you've read all the lines
# sort the hash so the most frequent words are first

# write the hash to STDIN
