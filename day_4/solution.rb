file = File.open("input.txt")
full_overlap, any_overlap = [], []

file.readlines.each do |line| # 2-8, 13-89
  elf_1_min, elf_1_max = line.split(",")[0].split("-").map(&:to_i)
  elf_2_min, elf_2_max = line.split(",")[1].split("-").map(&:to_i)

  if (elf_1_min.between?(elf_2_min, elf_2_max) and elf_1_max.between?(elf_2_min, elf_2_max)) or (elf_2_min.between?(elf_1_min, elf_1_max) and elf_2_max.between?(elf_1_min, elf_1_max))
    full_overlap << line
  end
  if (elf_1_min.between?(elf_2_min, elf_2_max) or elf_1_max.between?(elf_2_min, elf_2_max)) or (elf_2_min.between?(elf_1_min, elf_1_max) or elf_2_max.between?(elf_1_min, elf_1_max))
    any_overlap << line
  end
end

puts "Full Overlaps: #{full_overlap.count}"
puts "Any Overlaps: #{any_overlap.count}"