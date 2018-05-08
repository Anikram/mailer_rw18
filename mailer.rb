#encoding: UTF-8

require 'io/console'
require 'pony'

puts "Приветствую, я скрипт для отправки Вашей почты. Версия 2. Май 2018. Anikram."
puts
puts
sleep 1

my_mail = "4nikram@gmail.com"

puts "Введите пароль от вашей почты #{my_mail} для отправки письма:"
password = STDIN.noecho(&:gets).chomp

puts "Укажите тему письма"
subject = STDIN.gets.chomp

puts "Кому отправить?"
send_to = STDIN.gets.chomp

puts "Что написать?"
body = STDIN.gets.chomp

Pony.mail(
  :subject => subject,
  :body => body,
  :to => send_to,
  :from => my_mail,

  via: :smtp,
  via_options: {
    address: 'smtp.gmail.com',
    port: '587',
    enable_starttls_auto: true,
    user_name: my_mail,
    password: password,
    authentication: :plain,
  }
  )

puts "Письмо успешно отправлено!"
