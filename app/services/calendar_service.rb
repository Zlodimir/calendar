class CalendarService

  def initialize(data = [])
    @calendar = data.dup
  end

  def each(&block)
    @calendar.each(&block)
  end

  def sort_asc
    self.class.new(@calendar.sort_by { |e| e[:dtstart] })
  end

  def sort_desc
    self.class.new(@calendar.sort_by { |e| e[:dtstart] }.reverse)
  end

  def from_date(date = DateTime.now.to_date)
    self.class.new(@calendar.select { |e| e[:dtstart] >= date })
  end

  def by_location(place)
    self.class.new(@calendar.select { |e| e[:location] == place })
  end

  def by_description(descr)
    self.class.new(@calendar.select { |e| e[:description] == descr })
  end

  def limit(n)
    self.class.new(@calendar.first(n))
  end
end
