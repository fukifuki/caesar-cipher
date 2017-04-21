require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/caesar_cipher'


get '/' do
  @encoded_message = "biljance"
  erb :home
end


__END__
@@home
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Caesar Cipher</title>
</head>
<body>
  <p><%= @encoded_message %><p>
</body>
</html>
