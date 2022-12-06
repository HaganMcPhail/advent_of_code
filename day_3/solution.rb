def compartments(line)
  size = (line.length / 2) - 1
  return line.slice(0..size), line.slice(size+1..line.length)
end

def item_type(compartment_1, compartment_2)
  compartment_1.each_char do |item|
    return item if compartment_2.include?(item)
  end
end

def item_priority(item)
  ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'].index(item) + 1
end

part_1 = File.open("input.txt")
part_2 = File.open("input.txt")
prioritized_items = []
badges = []
count1 = 0
count2 = 0

part_1.readlines.each do |line|
  puts line
  count1 += 1
  compartment_1, compartment_2 = compartments(line)
  type = item_type(compartment_1, compartment_2)
  item_value = item_priority(type)
  prioritized_items << item_value
end
puts count1

part_1.readlines.each do |line|
  puts line
  count1 += 2
end
puts count2

elf_group_lines = part_2.readlines.each_slice(3).to_a

elf_group_lines.each do |group|
  group[0].strip.chars.each do |item|
    if group[1].include?(item) and group[2].include?(item)
      badges << item_priority(item)
      break
    end
  end
end

puts "Item Total: #{prioritized_items.sum}"
# puts "Badge Total: #{badges.sum}"