class Event < Tableless
  column :uid, :string
  column :dtstamp, :string
  column :dtstart, :date
  column :dtend, :date
  column :summary, :string
  column :description, :string
  column :location, :string
  column :url, :string
  #include ActiveModel::Model

  #attr_accessor :uid, :dtstamp, :summary, :description, :url, :location, :dtstart, :dtend
end
