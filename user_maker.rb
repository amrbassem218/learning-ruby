puts '***************** User Maker*****************'

Question = Struct.new(:title, :property_name, :format_check)
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
  }),

  Question.new('Enter your age: ', 'age', lambda { |age|
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
  user[ques.property_name] = if ques.property_name == 'marital_status'
                               user_statuses[answer]
                             else
                               answer
                             end
end

puts "\nUSER SUCESSFULLY CREATED!!!\n"

user.each_pair do |key, value|
  puts "#{key}: #{value}"
end
