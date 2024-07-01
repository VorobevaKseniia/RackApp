class TimeService

  TIME_FORMATS = {
    "year" => "%Y",
    "month" => "%m",
    "day" => "%d",
    "hour" => "%H",
    "minute" => "%M",
    "second" => "%S"
  }

  attr_reader :format, :time_string, :errors

  def initialize(format)
    @format = format.split(",")
    @errors = []
  end

  def success?
    errors.empty?
  end

  def format_time
    string = ""
    @format.each do |form|
      TIME_FORMATS.keys.include?(form) ? string += TIME_FORMATS[form] + "/" : @errors << form
    end
    @time_string = Time.now.strftime(string)
  end
end