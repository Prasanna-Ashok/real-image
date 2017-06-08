require 'csv'
require_relative 'distributor'
module Parsing
def self.check_area(reg)
	#if(hashed_data.find_by(city_name: reg[:city]))
 data=CSV.read("cities.csv",{headers: true, header_converters: :symbol})
 hashed_data= data.map {|d| d.to_hash}
 if(hashed_data.find{|v| v[:city_name].to_s == reg[:city].to_s})
 		if(hashed_data.find{|v| v[:province_name].to_s. ==reg[:state].to_s})
 			if(hashed_data.find{|v| v[:country_name].to_s == reg[:country].to_s})
 				return true
 			else
 				return false
 			end
 		end
end
if(reg[:city] == nil)
	if(hashed_data.find{|v| v[:province_name].to_s ==reg[:state].to_s})
 			if(hashed_data.find{|v| v[:country_name].to_s == reg[:country].to_s})
 				return true
			else
 				return false
 			end
 	end
 end
if(reg[:city] == nil && reg[:state] ==nil) 
 	if(hashed_data.find{|v| v[:country_name].to_s == reg[:country].to_s})
 				return true
 			else
 				return false
 			end		
end
end

#def self.check_exc(reg)
#	 data=CSV.read("cities.csv",{headers: true, header_converters: :symbol})
 #	 hashed_data= data.map {|d| d.to_hash}	
#end
end


# 	if((hashed_data.detect{|v|  }) != nil)
 #		puts "success" if((hashed_data.detect{|v| })!=nil)
 #	else
#	 	puts "success" if((hashed_data.detect{|v| v[:country].to_s == reg[:country].to_s})!=nil)
#	end
 #else
#	puts "success" if((hashed_data.detect{|v| v[:state].to_s == reg[:state].to_s && v[:country].to_s == reg[:country].to_s }) != nil)
 	#puts "Fail"
#hashed_data.each do |k,v|
#	puts "#{k} : #{v}"
