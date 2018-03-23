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

def get_japanese_emoticon(file_path, emoticon)
  hash = load_library(file_path)

  hash["get_emoticon"].each do |western_emoticon, japanese_emoticon|
    if emoticon == western_emoticon
      return japanese_emoticon
    end
  end

  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  hash = load_library(file_path)

  hash["get_meaning"].each do |japanese_emoticon, english_meaning|
    if emoticon == japanese_emoticon
      return english_meaning
    end
  end

  "Sorry, that emoticon was not found"
end

load_library("./lib/emoticons.yml")
