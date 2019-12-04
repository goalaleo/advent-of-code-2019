file_path = File.join(File.dirname(__FILE__), ARGV[0])

mass_to_fuel_conversion = ->(module_mass) { (module_mass/3).floor - 2 }

total_fuel = File.readlines(file_path)
              .map {|line| line.strip.to_f } # convert each line to float mass
              .sum(&mass_to_fuel_conversion)

puts total_fuel
