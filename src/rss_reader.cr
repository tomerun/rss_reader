require "./rss_reader/*"
require "kemal"

get "/" do
  "Hello World!"
end

Kemal.run(3001)
