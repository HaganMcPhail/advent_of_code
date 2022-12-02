file = File.open("input.txt").read
total = []
bags = file.split(/\n{2,}/)
bags.each do |bag|
  bag_total = bag.split(/\n/).map(&:to_i).sum
  total << bag_total
end
puts "Top Elf Total: #{total.sort.reverse[0]}"
puts "Top 3 Elf Total: #{total.sort.reverse[0..2].sum}"