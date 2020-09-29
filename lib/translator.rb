# require modules here
require "yaml"
require 'pry'

# Loads the emoticon YAML file using the yaml gem
# Accepts the relative path of the file
def load_library(path)
  data = YAML.load_file(path)
  # maps the data to their proper language despcriptions
  data.map do |key, value|
    data[key] = { english: value[0], japanese: value[1] }
  end
  data
end

# Get the japenese emoticon for the given english emoticon and the file path
def get_japanese_emoticon(path, emoticon)
  # load the data into a hash
  data = load_library(path)
  # Loop through all the data
  data.each do |key, value|
    #if there is a match for the english emoticon then return the japanese variant
    if value[:english] == emoticon
      return value[:japanese]
    end
  end
  # if the emoticon is not found a sorry message is returned
  return "Sorry, that emoticon was not found"
end

# Get the english name or meaning for a japenese emoticon
def get_english_meaning(path, emoticon)
  # Load the data
  data = load_library(path)
  # Loops across the data to see if it matches any japenese or english emoticon
  data.each do |key, value|
    if value[:japanese] == emoticon || value[:english] == emoticon
      # returns the name or meaning
      return key
    end
  end
  # if the emoticon is not found a sorry message is returned ``
  return "Sorry, that emoticon was not found"
end
