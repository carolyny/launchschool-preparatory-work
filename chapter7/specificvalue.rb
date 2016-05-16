family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }


if family.has_value?("jane")
  puts "yes"
else
  puts "no"
end
p family

if family.has_value?(["jane", "jill", "beth"])
  puts "yes"
else
  puts "no"
end
p family

opposites = {positive: "negative", up: "down", right: "left"}

if opposites.has_value?("negative")
  puts "Got it!"
else
  puts "Nope!"
end
