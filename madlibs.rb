# Build a dictionary of words
dictionary = {
	nouns: ['dog', 'car', 'mouse', 'clown', 'hat'],
	verbs: ['juggle', 'spin', 'speak'],
	adjectives: ['fantastic', 'great', 'red', 'big']
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

contents.gsub!('NOUN', dictionary[:nouns].sample)
contents.gsub!('VERB', dictionary[:verbs].sample)
contents.gsub!('ADJECTIVE', dictionary[:adjectives].sample)

p contents