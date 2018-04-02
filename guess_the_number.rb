def guess_number guess
    number = 25

    if guess < number
        puts "Guess was too low!"
    elsif guess > number
        puts "Guess was too high!"
    else
        puts "You got it!"
    end
end

guess_number(2)
guess_number(29)
guess_number(25)