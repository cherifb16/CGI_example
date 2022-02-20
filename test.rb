require 'webrick'

server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}

#server.mount('/test', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')
server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'kadai.html.erb')

# この一行を追記
#server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')
#server.mount('/goya.cgi',WEBrick::HTTPServlet::CGIHandler,'goya.rb')
server.mount('/kadai.cgi', WEBrick::HTTPServlet::CGIHandler, 'kadai.rb')
server.mount('/kadai2.cgi', WEBrick::HTTPServlet::CGIHandler, 'kadai2.rb')
server.start
