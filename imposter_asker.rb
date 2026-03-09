loop do
  is_imposter = false
  print 'Are you the imposter (y/n) : '
  answer = gets.chomp.downcase
  case answer
  when 'y'
    puts 'I HAVE FOUND THE IMPOSTER'
    is_imposter = true
  when 'n'
    puts 'Thank you, you can pass'
  else
    puts 'Answer with only y/n pls'
  end
  break if is_imposter
end
