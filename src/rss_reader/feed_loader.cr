require "xml"
require "./models"

class FeedLoader
  def initialize(xml : XML::Node)
    @xml = xml
  end
end
