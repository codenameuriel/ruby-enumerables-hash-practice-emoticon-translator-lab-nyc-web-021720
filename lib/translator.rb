require "yaml"

def load_library(file)
  emoticon = {}
  yaml_file = YAML.load_file(file)
  yaml_file.each do |key, value| 
    emoticon["get_meaning"] = {} unless emoticon["get_meaning"]
    emoticon["get_emoticon"] = {} unless emoticon["get_emoticon"]
    emoticon["get_meaning"][value[1]] unless emoticon["get_meaning"][value[1]] 
    emoticon["get_emoticon"][value[0]] unless emoticon["get_emoticon"][value[0]]
    emoticon["get_meaning"][value[1]] = key
    emoticon["get_emoticon"][value[0]] = value[1] 
  end
  return emoticon
end

# emoticon == english version emoticon 
def get_japanese_emoticon(file, emoticon)
  emoticon_hash = load_library(file)
  emoticon_hash.each do |key, value|
    value.each do |key, value|
      if key == emoticon
        return value 
      end
    end
  end
  return "sorry, don't know that one..."
end

def get_english_meaning(file, emoticon)
  load_library(file)
end