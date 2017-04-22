require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/caesar_cipher'


get '/' do
  @encoded_message = ""
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
  <header>
    <h1>Caesar Cipher</h1>
  </header>
  <form action '/' method='GET'>
    <textarea name="message" rows="10" cols="50" placeholder="Enter your message here..." autofocus></textarea><br />
    <p>Enter the key</p>
    <input type="number" name="key" />
    <input type="submit" value="Encode!" /> 
  </form>
  <p><%= @encoded_message %><p>
</body>
</html>
