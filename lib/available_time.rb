require "available_time/version"
require 'time'

module AvailableTime
	class TimeSlot
		attr_accessor :start_time,:end_time, :interval, :rest

		def initialize(start_time,end_time, interval: 30.minutes,rest: 0.minutes)
			@start_time = parse(start_time).to_i
			@end_time   = parse(end_time).to_i
			@interval = interval.to_i
			@rest = rest.to_i
		end

		def free_slots(appointments=[])
	    free_slots = []
	    curr_time = start_time 
	    while curr_time <= end_time - @interval ## Assuming last available time slot should not start after 4:30Pm
	      free_start_time = curr_time
	      free_end_time = free_start_time + @interval
	      status, conflict_end_time = check_availbility(free_start_time, free_end_time, appointments)
	      if status
	        free_slots << [Time.at(free_start_time).strftime("%I:%M %p"), Time.at(free_end_time).strftime("%I:%M %p")]
	        curr_time = free_end_time + @rest
	      else
	        curr_time = conflict_end_time[1] + @rest
	      end
	    end
	    return free_slots
		end


	 private

		def check_availbility(free_start_time=nil,free_end_time=nil,appointments)
		  free = true
	    conflict = nil
	    appointments.each do |ap|
	    	ap = parse(ap)
	      if (free_start_time+1).between?(ap[0], ap[1]) || (free_end_time-1).between?(ap[0], ap[1])
	        free = false
	        conflict = ap
	        break
	      end
	    end
	    return free, conflict
	  end

		def parse(time)
			if time.is_a? String
	      if time.match(".")
	         i_time = Time.parse(time.tr(".",":"))
	      else
	         i_time = Time.parse(time)
	      end
		  elsif time.is_a? Array
		  	time.map {|t| parse(t).to_i}
		  else
		     	i_time = Time.parse(('%.2f' % time).tr(".",":"))
			end
		end
	end
end
