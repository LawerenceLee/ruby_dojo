require_relative "ninja"
require_relative "wizard"
require_relative "samurai"

wiz = Wizard.new
wiz.context
ninja = Ninja.new
puts ninja.context
# samurai = Samurai.new
# puts samurai.context
# human = Human.new
# puts human.context