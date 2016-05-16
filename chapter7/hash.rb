family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }


family2 = family.select{|k,v| k == :sisters || k == :brothers}
family2array = family2.values.flatten
puts family2array
p family2array
