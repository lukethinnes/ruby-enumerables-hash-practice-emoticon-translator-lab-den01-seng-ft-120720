require 'yaml'
require 'pry'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  results = {}
  emoticons.each do |key, value|
    results[key]={}
    results[key][:english]=value[0]
    results[key][:japanese]=value[1]
  end
  results
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  emoticons.each do |key, value|
    if value[:japanese] == emoticon
      return key
    end
  end
  return "This is not a valid emoticon."
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  emoticons.each do |key, value|
    if value[:english] == emoticon
      return value[:japanese]
    end
  end
  return "This is not a valid emoticon."
end
