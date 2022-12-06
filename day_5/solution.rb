def grid(file)
  structure = [[],[],[],[],[],[],[],[],[]]
  file.readlines.first(8).reverse.each do |line|
    line.sub!("   ", "'@'")
    line.gsub!(/    /, " '@'")
    line.split(" ").each_with_index do |cell, index|
      structure[index] << cell if cell != "'@'"
    end
  end
  structure
end

def move_container(prepped_grid, amount, desitnation, origin)
  crates = prepped_grid[origin - 1].pop(amount)
  prepped_grid[desitnation - 1].concat(crates.reverse) #crates.reverse for part 1
end

file = File.open("input.txt")
sequence = File.open("input.txt")
prepped_grid = grid(file)

sequence.readlines.last(504).each_with_index do |line, index|
  amount = line.split(" ")[1].to_i
  origin = line.split(" ")[3].to_i
  desitnation = line.split(" ")[5].to_i
  move_container(prepped_grid, amount, desitnation, origin)
end

p "RESULT: #{prepped_grid[0].last}#{prepped_grid[1].last}#{prepped_grid[2].last}#{prepped_grid[3].last}#{prepped_grid[4].last}#{prepped_grid[5].last}#{prepped_grid[6].last}#{prepped_grid[7].last}#{prepped_grid[8].last}"