require "yaml"

def load_library(file_path)
  hash = YAML.load_file(file_path)
  new_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  
  hash.each do |meaning, emoticons|
    new_hash["get_meaning"][emoticons[1]] = meaning
    new_hash["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  
  new_hash
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end

load_library("./lib/emoticons.yml")
