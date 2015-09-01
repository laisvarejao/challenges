def valid?(expression)
  /\d(\s[\*\/\-\+])\s\d)*/.match(expression)
end

def is_number?(string)
  true if Float(string) rescue false
end

def run()
  puts 'Please, provide a expression:'
  expression = gets.chomp
  if valid?(expression)
    numbers, operators = parse expression
    total = calculate(numbers, operators)
    puts "The total is: #{total}"
  else
    puts "Expression is invalid!"
  end
end

def parse(expression)
  numbers = []
  operators = []

  expression.split(' ').each do |char|
    if is_number?(char)
      numbers << char.to_i
    else 
      operators << char
    end
  end
  return numbers, operators
end

def calculate(numbers, operators)
  total = numbers.shift
  numbers.each do |number|
    operator = operators.shift
    total += number if operator == '+'
    total -= number if operator == '-'
    total *= number if operator == '*'
    total /= number if operator == '/'    
  end
  total
end

while(true)
  run()
end