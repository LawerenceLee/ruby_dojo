class DojosController < ApplicationController
  def main
    @count = Dojo.count
    @dojos = Dojo.all
  end
end
