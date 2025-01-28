# Write your solution here!
require "rqrcode"

loop do
  puts "What kind of QR code would you like to generate?"
  puts "1. URL"
  puts "2. Wifi network"
  puts "3. Text message"
  puts "4. Exit"
  
  user_input = gets.chomp

  if user_input == "1"
    puts "What is the URL?"
    url_input = gets.chomp
    puts "Encoding URL: #{url_input}" # This will confirm what URL is being encoded.
    
    qrcode = RQRCode::QRCode.new(url_input) # Generate and save QR code for URL
    png = qrcode.as_png({ :size => 500 })
    file_name = "url_qr_code.png"
    IO.binwrite(file_name, png.to_s)
   
    puts "QR code generated and saved as '#{file_name}'."

  elsif user_input == "2"
    puts "What is the WiFi network name?"
    wifi_network_input = gets.chomp
    puts "What is the WiFi password?"
    wifi_password_input = gets.chomp
    encoded_wifi_details = "WIFI:T:WPA;S:#{wifi_network_input};P:#{wifi_password_input};;"
   
    qrcode = RQRCode::QRCode.new(encoded_wifi_details) # Generate and save QR code for WiFi
    png = qrcode.as_png({ :size => 500 })
    file_name = "url_qr_code.png"
    IO.binwrite(file_name, png.to_s)
   
    puts "QR code generated and saved as '#{file_name}'."

  elsif user_input == "3"
    puts "What is the mobile number? (Please give only numbers and no spaces)"
    mobile_number_input = gets.chomp
    puts "What is the message you want to send?"
    message_input = gets.chomp
    encoded_sms_details = "SMSTO:#{mobile_number_input}:#{message_input}"

    qrcode = RQRCode::QRCode.new(encoded_sms_details) # Generate and save QR code for SMS
    png = qrcode.as_png({ :size => 500 })
    file_name = "url_qr_code.png"
    IO.binwrite(file_name, png.to_s)
   
    puts "QR code generated and saved as '#{file_name}'."
  elsif user_input == "4"
    puts "Goodbye!"
    break
  else
    puts "Invalid option, please try choose 1 through 4."
  end
end
