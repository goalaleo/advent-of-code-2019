# this version also take the mass of the fuel recursively into account

def fuel_needed_for(mass)
  fuel_mass = (mass.to_f/3).floor - 2
  return 0 if fuel_mass <= 0

  fuel_mass + fuel_needed_for(fuel_mass)
end

file_path = File.join(File.dirname(__FILE__), ARGV[0])

total_fuel_needed = File.readlines(file_path)
              .map {|line| line.strip.to_f }
              .sum { |module_mass| fuel_needed_for(module_mass) }

puts total_fuel_needed
