def calculate_score(line)
  elf = ['A', 'B', 'C']
  me = ['X', 'Y', 'Z']
  elf_result = elf.find_index(line.split(" ")[0])
  my_result = me.find_index(line.split(" ")[1])
  score = my_result + 1

  if (my_result > elf_result) || (my_result == 0 and elf_result == 2)
    unless elf_result == 0 and my_result == 2
      score += 6
    end
  elsif my_result == elf_result
    score += 3
  end
  score
end

def calculate_by_outcome(line)
  elf = ['A', 'B', 'C']
  outcome = ['X', 'Y', 'Z']
  elf_result = elf.find_index(line.split(" ")[0])
  result = outcome.find_index(line.split(" ")[1])

  case result
    when 0
      my_result = elf_result == 0 ? 2 : elf_result - 1
      score = my_result + 1
    when 1
      my_result = elf_result
      score = my_result + 4
    when 2
      my_result = elf_result == 2 ? 0 : elf_result + 1
      score = my_result + 7
  end
  score
end

file = File.open("input.txt")
round_totals = []
new_totals = []
bags = file.readlines.map(&:chomp).each do |line|
  round_totals << calculate_score(line)
  new_totals << calculate_by_outcome(line)
end

puts "Total: #{round_totals.sum}"
puts "Total: #{new_totals.sum}"

# test = [
#   'A X',
#   'A Y',
#   'A Z',
#   'B X',
#   'B Y',
#   'B Z',
#   'C X',
#   'C Y',
#   'C Z',
# ]