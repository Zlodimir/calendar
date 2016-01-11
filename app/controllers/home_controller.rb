class HomeController < ApplicationController
  def index
    content = File.read('kalender.ics')

    unless content.valid_encoding?
      content.tidy_bytes! 
      content.gsub!(/\r/, "\r\n")
    end

    content = Icalendar.parse(content).first

    calendar_data = []
    content.events.each do |event|
      calendar_data << { uid: event.uid, dtstamp: event.dtstamp, summary: event.summary, description: event.description, url: event.url, location: event.location, dtstart: event.dtstart, dtend: event.dtend }
    end   
    @calendar = CalendarService.new(calendar_data)

    Rails.logger.debug("EBAT!!!!!!!!!!#{@calendar}")
  end
end
