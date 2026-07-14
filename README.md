# AvailableTime

A Ruby gem to find available time slots within a working day, accounting for scheduled appointments and rest periods.

## Features

- Find free time slots in a given day
- Support for multiple time formats (24-hour, 12-hour with AM/PM)
- Configurable time slot intervals (default: 30 minutes)
- Optional rest periods between appointments
- Automatic handling of overlapping appointments

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'available_time'
```

Then execute:

```bash
$ bundle
```

Or install it yourself:

```bash
$ gem install available_time
```

## Usage

### Basic Example

Create a `TimeSlot` object with your working hours and get free time slots:

```ruby
# Create a time slot from 8:30 AM to 5:30 PM
time_slot = AvailableTime::TimeSlot.new(8.30, "5.30pm")

# Define your appointments as [start_time, end_time] pairs
appointments = [
  ["09:00", "9:30"],
  ["10:01", "11:30"],
  ["14:00", "16:30"],
  ["13:01", "13:30"]
]

# Get available time slots
free_slots = time_slot.free_slots(appointments)
# => [["08:30 AM", "09:00 AM"], ["09:30 AM", "10:01 AM"], ["11:30 AM", "01:00 PM"], ...]
```

### Supported Time Formats

The gem supports multiple time format variations for maximum flexibility:

```ruby
time_slot = AvailableTime::TimeSlot.new(8.30, "5.30pm")
time_slot = AvailableTime::TimeSlot.new(8.30, "17.30")
time_slot = AvailableTime::TimeSlot.new(8.30, "17:30")
time_slot = AvailableTime::TimeSlot.new(8.30, "5:30pm")

# Appointments also support multiple formats
appointments = [
  ["09:00", "9:30"],
  ["10:01", "11:30"],
  ["14:00", "16:30"],
  ["1:01pm", "1:30pm"],
  ["12:30 PM", "01:00 PM"]
]
```

### Configurable Interval

By default, available time slots are returned in 30-minute intervals. You can customize this:

```ruby
# Get 5-minute intervals
time_slot = AvailableTime::TimeSlot.new(8.30, "5.30pm", interval: 5.minutes)
free_slots = time_slot.free_slots(appointments)
```

### Rest Periods

Add mandatory rest time between available slots (useful for scheduling buffer time):

```ruby
# Include a 5-minute rest period between slots
time_slot = AvailableTime::TimeSlot.new(8.30, "5.30pm", rest: 5.minutes)
free_slots = time_slot.free_slots(appointments)
# => [["08:30 AM", "09:00 AM"], ["09:05 AM", "09:35 AM"], ["09:40 AM", "10:10 AM"], ...]
```

## Return Format

The `free_slots` method returns an array of available time slots as `[start_time, end_time]` pairs, formatted in 12-hour time with AM/PM notation:

```ruby
[
  ["08:30 AM", "09:00 AM"],
  ["09:30 AM", "10:01 AM"],
  ["11:30 AM", "01:00 PM"],
  # ... more slots
]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jenorish/available_time. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/jenorish/available_time/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AvailableTime project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jenorish/available_time/blob/master/CODE_OF_CONDUCT.md).
