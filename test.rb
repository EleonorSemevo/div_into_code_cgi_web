require 'webrick'
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
server.mount('/test', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')

server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb');

#The new routes difined for the exercice

server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'home.html.erb')  #The arbitrary html page
server.mount('/home.cgi', WEBrick::HTTPServlet::CGIHandler, 'home.rb')
server.mount('/consumption.cgi', WEBrick::HTTPServlet::CGIHandler, 'consumption.rb')
server.start