require 'rack'

app = Proc.new do |env|
  [
    200,
    { 'Content-Type' => 'text/plain' },
    ["Welcome abroad!\n"]
  ]
end

Rack::Handler::WEBrick.run app