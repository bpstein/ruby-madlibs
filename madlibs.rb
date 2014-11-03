# Build a dictionary of words
nouns = File.open('nouns.txt', 'r') do |f|
	f.read
end.split

verbs = File.open('verbs.txt', 'r') do |f|
	f.read
end.split

adjectives = File.open('adjectives.txt', 'r') do |f|
	f.read
end.split

dictionary = {
	nouns: nouns,
	verbs: verbs,
	adjectives: adjectives
}

# Method to format user messages
def say(msg)
	puts "=> #{msg}"
end

def exit_with(msg)
	say msg 
	exit
end

exit_with("No input file!") if ARGV.empty?
exit_with("File doesn't exist!") if !File.exists?(ARGV[0])

contents = File.open(ARGV[0], 'r') do |f|
	f.read
end

# Generate random nouns
contents.gsub!('NOUN').each do |noun|
	dictionary[:nouns].sample
end

# Generate random verb
contents.gsub!('VERB').each do |verb|
	dictionary[:verbs].sample
end

# Generate random adjective
contents.gsub!('ADJECTIVE').each do |adjective|
	dictionary[:adjectives].sample
end

p contents