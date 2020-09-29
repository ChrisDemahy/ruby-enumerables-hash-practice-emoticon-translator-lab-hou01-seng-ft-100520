# require modules here
require "yaml"
require 'pry'

def load_library(path)
  data = YAML.load_file(path)
  data.collect do |key, value|
    data[key] = { english: value[0], japanese: value[1] }
  end
  data
end

def get_japanese_emoticon(path, emoticon)
  data = load_library(path)
  data.each do |key, value|
    if value[:english] == emoticon
      value[:japanese]
    end
  end
end

def get_english_meaning(path, emoticon)
  # code goes here
  data = load_library(path)
  data.each do |key, value|
    if value[:japanese] == emoticon
      binding.pry
      key
    end
  end
end
