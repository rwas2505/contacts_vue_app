# Build a terminal dictionary app
# Create a new ruby file called dictionary_app.rb
# The program should ask the user to enter a word, then use the wordnik API to show the word’s definition: https://developer.wordnik.com/docs#!/word/getDefinitions
# Once that works, have it also display the top example and pronunciation (browse through the documentation to the top example and pronunciation).
# Bonus: Write your program in a loop such that the user can keep entering new words without having to restart the program. Give them the option of entering q to quit.
# Bonus: Search for the audio section in the documentation. Use wordnik’s audio api to get the first fileUrl to open in the browser (you’ll need to google this!) and pronounce the name of the word.

#API KEY b05bbefa71250039e60030a86260994d095206c2efdc555ad

require 'http'

while true
  look_up = gets.chomp

  if look_up.downcase == "q"
    break
  else

  response_definition = HTTP.get("https://api.wordnik.com/v4/word.json/#{look_up}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=b05bbefa71250039e60030a86260994d095206c2efdc555ad")

  response_example = HTTP.get("https://api.wordnik.com/v4/word.json/#{look_up}/examples?includeDuplicates=false&useCanonical=false&limit=5&api_key=b05bbefa71250039e60030a86260994d095206c2efdc555ad")

  pronunciation_example = HTTP.get("https://api.wordnik.com/v4/word.json/#{look_up}/pronunciations?useCanonical=false&limit=50&api_key=b05bbefa71250039e60030a86260994d095206c2efdc555ad")

  pp response_definition.parse[1]["text"]

  pp response_example.parse["examples"][0]["url"]

  pp pronunciation_example.parse[0]["raw"]
  end
end

