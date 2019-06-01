require "sqlite3"
require "granite/adapter/sqlite"

Granite::Adapters << Granite::Adapter::Sqlite.new({name: "db", url: ENV["DB_URL"]})

class Feed < Granite::Base
  adapter db

  enum Type
    RSS1,
    RSS2,
    ATOM
  end

  field name : String
  field url : String
  field link : String
  field description : String
  field date : Time
  field feed_type : Type
  timestamps

  has_many :entries

  validate_not_blank :name
  validate_not_blank :url
  validate_uniqueness :url
  validate_not_blank :link
  validate_not_nil :feed_type
end

class Entry < Granite::Base
  adapter db

  field feed_id : Int32
  field title : String
  field link : String
  field summary : String
  field content : String
  field seen : Bool, default: false
  field clicked : Bool, default: false
  field date : Time
  timestamps

  belongs_to :feed

  validate_not_blank :title
  validate_not_blank :link
  validate_uniqueness :link
  validate_not_nil :seen
  validate_not_nil :clicked
end
