require 'httparty'

WTTR_ENDPOINT = 'https://wttr.in/Allen,%20Texas,%20United%20States?TQ0'
README_FILE = '../README.md'
WEATHER_PLACEHOLDER_START = '<!-- WEATHER:BEGIN -->'
WEATHER_PLACEHOLDER_END = '<!-- WEATHER:END -->'
WEATHER_PLACEHOLDER_REGEX = /#{WEATHER_PLACEHOLDER_START}[\s\S]*?#{WEATHER_PLACEHOLDER_END}/

weather = HTTParty.get(WTTR_ENDPOINT, headers: { 'User-Agent': 'curl' }).body

content = "\n\`\`\`\nWeather in Allen:\n\n#{weather}\`\`\`\n"

readme = File.read(README_FILE)
readme.gsub!(WEATHER_PLACEHOLDER_REGEX, "#{WEATHER_PLACEHOLDER_START}\n#{content}\n#{WEATHER_PLACEHOLDER_END}")

File.open(README_FILE, 'w') { |f| f.puts readme }
