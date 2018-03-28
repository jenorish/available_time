# AvailableTime

Gem to find available time in a day.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'available_time'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install available_time

## Usage

 ## Supporting multiple format calling
	    t =  AvailableTime::TimeSlot.new(8.30,"5.30pm")
	    t =  AvailableTime::TimeSlot.new(8.30,"17.30")
	    t =  AvailableTime::TimeSlot.new(8.30,"17:30")
	    t =  AvailableTime::TimeSlot.new(8.30,"5:30pm")
	    appointments = [["09:00","9:30"],["10:01","11:30"],["14:00","16:30"],["13:01","13:30"]]
        t.free_slots(appointments)
	   result =>  [["08:30 AM", "09:00 AM"], ["09:30 AM", "10:00 AM"], ["11:30 AM", "12:00 PM"], ["12:00 PM", "12:30 PM"], ["12:30 PM", "01:00 PM"], ["01:30 PM", "02:00 PM"], ["04:30 PM", "05:00 PM"], ["05:00 PM", "05:30 PM"]]
	  
 ## Supporting multile time format

	  appointments = [["09:00","9:30"],["10:01","11:30"],["14:00","16:30"],["1:01pm","1:30 Pm"],["12:30PM", "01:00PM"]]
	  appointments = [["09:00","9:30"],["10:01","11:30"],["14:00","16:30"],["1:01pm","1:30 Pm"],["12:30 PM", "01:00 PM"]]

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/available_time. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AvailableTime project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/available_time/blob/master/CODE_OF_CONDUCT.md).

# available_time

