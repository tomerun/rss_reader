require "sqlite3"
require "crecto"

module MyRepo
  extend Crecto::Repo

  config do |conf|
    conf.adapter = Crecto::Adapters::SQLite3
    conf.database = ENV["DB_URL"]
  end
end

class Feed < Crecto::Model
  enum Type
    RSS1,
    RSS2,
    ATOM
  end

  schema "feeds" do
    field :name, String
    field :url, String
    field :link, String
    field :description, String
    field :date, Time
    field :type, Type
  end

  has_many :entries, Entry

  validate_required [:name, :url, :link, :type]

  unique_constraint :url
end

class Entry < Crecto::Model
  schema "entries" do
    field :feed_id, Int32
    field :title, String
    field :link, String
    field :summary, String
    field :content, String
    field :seen, Bool, default: false
    field :clicked, Bool, default: false
    field :date, Time
  end

  belongs_to :feed, Feed

  validate_required [:title, :link, :seen, :clicked]

  unique_constraint :link
end

if ENV["ENABLE_DEBUG"]?
  Crecto::DbLogger.set_handler(STDOUT)
end
