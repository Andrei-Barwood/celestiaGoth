require 'net/http'
require 'uri'
require 'fileutils'

url = "https://mlp.fandom.com/wiki/Friendship_is_Magic_animated_media"
uri = URI.parse(url)
response = Net::HTTP.get_response(uri)

unless response.is_a?(Net::HTTPSuccess)
  puts "Failed to fetch: #{response.code}"
  exit
end

html = response.body

# The fandom wiki typically lists episodes in tables.
# We'll look for links that match /wiki/Episode_Title
# This is a bit tricky with regex, so we'll look for standard table rows.
# Each episode row usually has a number and a title.

# Let's extract all links that seem to be episodes.
# A better way is to find text inside quotes or specific table cells, but let's try a regex for the episode links.
# Example: <td>"<a>Title</a>"</td>
matches = html.scan(/<td>"([^"]*<a href="\/wiki\/[^"]+"[^>]*>([^<]+)<\/a>[^"]*)"<\/td>/i)
# Wait, let's just use a simpler regex to extract episode names from the tables.
# Usually, episodes are listed with <th> or <td> and quotes around the title.
# Let's write the HTML to a file and analyze it.

File.write('episodes_raw.html', html)
puts "HTML saved to episodes_raw.html"
