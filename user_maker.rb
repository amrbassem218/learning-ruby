puts '***************** User Maker*****************'

Question = Struct.new(:title, :property_name, :format_check, :post_processing)
User = Struct.new(:name, :age, :marital_status)
user = User.new

user_statuses = {
  's' => 'single',
  'm' => 'married',
  'd' => 'difforced'
}
questions = [
  Question.new('Enter your name: ', 'name', lambda { |name|
    is_valid = false
    error_message = ''
    if name.empty?
      error_message = 'Field is empty. pls fill it :)'
    elsif name.length > 100
      error_message = 'Hey what kind of name is that? Pls choose a smaller name'
    else
      is_valid = true
    end
    { "valid": is_valid, "error_message": error_message }
  }, lambda { |name|
    new_name = ''
    name.split(' ').each do |i|
      new_name << i.capitalize
    end
    new_name
  }),

  Question.new('Enter your age: ', 'age', lambda { |age|
    # check if string is number
    is_number = age.match?(/^\d+$/)
    unless is_number
      return { valid: false, error_message: 'Pls enter numbers only (fractions, periods, and commas are not allowed either)' }
    end

    age = age.to_i
    is_valid = false
    error_message = ''
    if age < 18
      error_message = 'You must be over 18 to use the platform'
    elsif age > 120
      error_message = "Hey Mr., not be rude but pls email me your diet. That's impressive age unfortunately we're not available for over 120yr olds"
    else
      is_valid = true
    end
    { "valid": is_valid, "error_message": error_message }
  }),

  Question.new('Enter marital status ( (m) for married, (s) for single, (d) for diforced) (m/s/d): ', 'marital_status', lambda { |status|
    is_valid = (user_statuses.include? status)
    { "valid": is_valid, "error_message": !is_valid ? 'Please only type one of those 3 letters (m/s/d)' : '' }
  }, lambda { |status|
       user_statuses[status].capitalize
     })
]

def ask(prompt)
  print prompt
  gets.chomp
end

def get_valid_ans(ques)
  loop do
    answer = ask(ques.title)
    format_check_res = ques.format_check.call(answer)
    return answer if format_check_res[:valid]

    if format_check_res[:error_message].empty?

      puts 'Wrong format please re-enter that again. RIGHT THIS TIME'
    else
      puts format_check_res[:error_message]
    end
  end
end
questions.each do |ques|
  answer = get_valid_ans(ques)
  answer = ques.post_processing.call(answer) if ques.post_processing
  user[ques.property_name] = answer
end

puts "\nUSER SUCESSFULLY CREATED!!!\n"

user.each_pair do |key, value|
  puts "#{key}: #{value}"
end
