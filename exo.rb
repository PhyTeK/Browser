require 'tk'
#require 'rubygems'
#require 'nokogiri'
require 'net/http'
require 'open-uri'

root = TkRoot.new

url = 'http://www.dn.se'

frame = Tk::Frame.new(root)
frame.pack(:side => 'top')
entry = Tk::Text::Entry.new(frame,:width=> 40, :textvariable => url)
entry.pack(:side => 'left')
button = Tk::Button.new(frame, :text => 'Go', :command => proc{parse})
button.pack(:side => 'left')
$text = Tk::Text.new(root)
$text.pack(:side =>'bottom')


uri = URI(url)
$body = Net::HTTP.get(uri)

def parse
  $text.insert 'end', $body.gsub(/\s+/,' ')
end


Tk.mainloop


