# Write your solution here!
require "rqrcode"

user_input = gets.chomp

puts user_input
puts “What kind of QR code would you like to generate? (1 for URL, 2 for wifi network, 3 for text message, 4 to exit)”

loop do
  puts "What kind of QR code would you like to generate?"
  puts "1. URL"
  puts "2. Wifi network"
  puts "3. Text message"
  puts "4. Exit"
  
  user_input = gets.chomp

  if user_input == "1"
    url_input = gets.chomp
    puts url_input
    puts "What is the URL?"
    qrcode = RQRCode::QRCode.new(url_input)
  elsif user_input == "2"
    wifi_network_input = gets.chomp
    puts wifi_network_input
    puts "What is the WiFi network?"
    wifi_password_input = gets.chomp
    puts wifi_password_input
    puts "What is the WiFi password?"
    qrcode = WIFI:T:WPA;S:wifi_network_input;P:wifi_password_input;;
  elsif user_input == "3"
    mobile_number_input = gets.chomp
    puts mobile_number_input
    puts "What is the mobile number? (Please give only numbers and no spaces)"
    SMSTO:mobile_number_input:Hi, it's
    break # Remove this line after implementing the QR code generation
  elsif user_input == "4"
    puts "Goodbye!"
    break
  else
    puts "Invalid option, please try again."
  end
end

# Use the RQRCode::QRCode class to encode some text
qrcode = SMSTO:"9876543210":"Hi Alice! It's"

# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })

# Write the image data to a file
IO.binwrite("sometext.png", png.to_s)
