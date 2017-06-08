require_relative 'parsing'
class Distributor
	@@dist= {}
	attr_accessor :name, :incl, :excl, :parent_name
	def initialize(name,inc,exc)
		sn=name.split('<')
		@name=sn[0]
		self.set_name(@name)
	   	self.set_inc(inc)
	   	self.set_exc(exc)
		check_all(incl.to_s, excl.to_s)
		if sn.length > 1 then
        	@parent_name= sn[1]
        	parent=@@dist[@parent_name]
	 		self.set_parent_name(@parent_name)
	 	#	par_exc=parent.get_exc
	 	end
	 	if(parent)
	 		self.set_exc(exc) << parent.get_exc
	 	end
	 	@@dist[@name]=self
	 	if(parent)
	 		x=self.get_inc.split(/\n/)
	 		x.each do |i|
	 			flag=self.inc_exc(i,parent.get_inc,parent.get_exc)
	 			puts flag
	 		end	
			y=self.get_exc.split(/\n/)
			y.each do |j|
				flag=self.inc_exc(j,parent.get_inc,parent.get_exc)
				puts flag
			end	
		end
	end
	def set_name(name)
		@name=name
	end
	def set_inc(inc)
		@incl= inc
	end
	def set_exc(exc)
		@excl=exc
	end
	def set_parent_name(parent_name)
		@parent_name=parent_name
	end
	def get_name
		return name
	end
	def get_inc
		return incl
	end
	def get_exc
		return excl
	end
	def get_parent_name
		return parent_name	
	end
	def check_all(incl, excl)
    	ic_arr= self.get_inc.split(/\n/)
		reg_inc={}
		ic_arr.each do |i|
			reg_inc=city_convert(i)
			if(Parsing.check_area(reg_inc))
				puts "Valid"
			else
				puts "Invalid"
			end
		end
		ex_arr=self.get_exc.split(/\n/)
		reg_exc={}
		ic_arr.each do |i|
			ex_arr.each do |j|
				reg_exc=city_convert(j)
				if(Parsing.check_area(reg_exc))
					reg_inc=city_convert(i)
					#puts "Accepted"if(reg_exc[:country]==reg_inc[:country])
					if(reg_exc[:country]==reg_inc[:country])			
					end
				else
					puts "Invalid entry"
				end
			end
		end
	end
	
	def city_convert(ic)
			region={}
			arr=ic.split('-')
			c=ic.count('-')
			if(c==2)	
				region[:city]=arr[0]
				region[:state]= arr[1]
				region[:country]= arr[2].chomp
			elsif(c==1)
				region[:city]=nil
				region[:state]=arr[0]
				region[:country]=arr[1].chomp
			else
				region[:city]=nil
				region[:state]=nil
				region[:country]=arr[0].chomp
			end
		return region
	end	
	def inc_exc(region,par_inc,par_exc)
			i=city_convert(region)
			flag=true if(par_inc.include?(i[:country].to_s))
			flag=false if(par_exc.include?(i[:state].to_s))
			return flag			
	end
	def self.check_regions(dist_name,region)
		@distributor_name=dist_name
		dist1=@@dist[@distributor_name]
		flag=dist1.inc_exc(region,dist1.get_inc,dist1.get_exc) 		
		puts flag
	end
end
