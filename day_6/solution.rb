file = File.open("input.txt")
chars = file.read.chars
start_of_packet_marker = []
chars.first(14).each do |char|
  start_of_packet_marker << char
end
char_count = 0
puts chars.length


chars.last(chars.length - 14).each do |c|
  char_count += 1
  if start_of_packet_marker.uniq.length == start_of_packet_marker.length
    break
  else
    start_of_packet_marker << c
    start_of_packet_marker.shift
  end
end

puts char_count + 13
puts start_of_packet_marker