require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/caesar_cipher'


get '/' do
  @encoded_message = ""
  
  erb :home
end

post '/' do
  message = params[:message]
  key = params[:key].to_i
  cipher = CaesarCipher.new(message, key)
  @encoded_message = cipher.encode
  
  erb :home
end


__END__

@@layout
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Caesar Cipher</title>
</head>
<body>
  <header>
    <h1>Caesar Cipher</h1>
    <nav>
      <ul>
        <li>home</li>
        <li>about</li>
      </ul>
    </nav>
  </header>
  <section>
  <%= yield %>
  </section>
</body>
</html>

@@home
<form action '/' method='POST'>
  <textarea name="message" rows="10" cols="50" placeholder="Enter your message here..." autofocus></textarea><br />
  <p>Enter the key</p>
  <input type="number" name="key" />
  <input type="submit" value="Encode!" /> 
</form>
<p><%= @encoded_message %><p>