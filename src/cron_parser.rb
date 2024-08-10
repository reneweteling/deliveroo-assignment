class CronParser
  def self.parse_field(field, min, max)
    if field == '*'
      (min..max).to_a
    else
      # for: */15
      field.split(',').flat_map do |part|
        # for: 1/15
        if part.include?('/')
          start, step = part.split('/')
          start = start == '*' ? min : start.to_i
          (start..max).step(step.to_i).to_a
        # for: 1-5
        elsif part.include?('-')
          start, stop = part.split('-').map(&:to_i)
          (start..stop).to_a
        # for: 1
        else
          part.to_i
        end
      end.uniq.sort
    end
  end

  def self.parse_cron(cron_string)
    fields = cron_string.split
    minute = parse_field(fields[0], 0, 59)
    hour = parse_field(fields[1], 0, 23)
    day_of_month = parse_field(fields[2], 1, 31)
    month = parse_field(fields[3], 1, 12)
    day_of_week = parse_field(fields[4], 0, 6)
    command = fields[5..].join(' ')

    [
      ['minute', minute],
      ['hour', hour],
      ['day of month', day_of_month],
      ['month', month],
      ['day of week', day_of_week],
      ['command', [command]]
    ]
  end

  def self.print_cron(cron_string)
    result = parse_cron(cron_string)
    char_length = result.to_h.keys.max_by(&:length).length + 2
    result.map do |field, values|
      "#{field.ljust(char_length)}#{values.join(' ')}"
    end.join("\n")
  end
end
