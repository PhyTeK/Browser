require 'tk'
require 'tkextlib/tile'
#require 'net/http'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = 'http://example.com/index.html?count=10'
url = 'https://www.sunet.se'
url = 'http://www.dn.se' #Uniform Resource Locator
uri = URI(url)           #Uniform Resource Identifier

#body = Net::HTTP.get(uri)


root = TkRoot.new

text = Tk::Text.new(root) do
  width 80
  height 50
  font TkFont.new('courier 10')
  pack(:side => 'bottom')
end



url = TkVariable.new

top = Tk::Frame.new(root)
top.pack(:fill => 'both', :side => 'top')
entry = Tk::Entry.new(top, :textvariable => url, :width => 60 )

entry.pack(:side => 'left')

button =Tk::Button.new(top) { text 'Go'; command proc { parse(url.to_s, text) } }
button.pack(:side => 'left')



def parse(url, text)

  page = Nokogiri::HTML(open(url))

  page.xpath("//script").remove
  page.xpath("//style").remove
  page.xpath("//a").remove
  page.xpath("//img").remove

  text.insert 'end', page.text.gsub(/\s+/, ' ')

end


Tk.mainloop

