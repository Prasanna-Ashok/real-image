require './distributor.rb'
ch='y'
while(ch=='y')
	puts "Permissions for distributor:"
	puts "Enter the name"
	name= gets.chomp
	puts "Enter the inclusions:"
	inc=""
	while(incl=gets) !="\n"
		inc<<incl
	end
	puts "Enter the exclusions:"
	exc=""
	while(excl=gets) !="\n"
		exc<<excl
	end
	Distributor.new(name,inc,exc)
	puts "Do you wish to add another distributor ? y/n"
	ch=gets.chomp
end	
require_relative 'parsing'
ch1='y'
while(ch1=='y')
	puts "Enter distributor name to be found:"
	dist_name=gets.chomp
	puts "Region ?"
	region=gets.chomp
    flag=Distributor.check_regions(dist_name,region)
	puts flag
	puts "Do you wish to continue? y/n"
	ch1=gets.chomp
end





