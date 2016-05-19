def lab_in_string(string)
  if string =~ /lab/
    puts "We have a match! #{string}"
  else
    puts "No match here."
  end
end
lab_in_string("laboratory")

lab_in_string("experiment")

lab_in_string("Pans Labyrinth")

lab_in_string("polar bear")

lab_in_string("elaborate")
