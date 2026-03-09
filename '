puts "**************Illegal Username Checker************** \n "
name = ''
is_illegal = true
while is_illegal
  is_illegal = false
  print 'Enter your username: '
  name = gets.chomp.downcase
  illegel_names = %w[linux linus nvim arch]
  illegel_names.each do |illegal_name|
    if name.include? illegal_name
      puts "Your name contains an illegal part (being #{illegal_name}) pls change it :D"
      is_illegal = true
    end
  end
end
def name_formatter(name)
  name.split(' ').map(&:capitalize).join(' ')
  name.split(' ').map(&:capitalize).join(' ')
end
puts 'Yipee! your name is fine'
puts "Hi mr \"#{name_formatter(name)}\" "
