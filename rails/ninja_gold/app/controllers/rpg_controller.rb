# require_relative "activity_classes"

class RpgController < ApplicationController
  load 'activity_classes.rb'
  def index
    if not session["gold"]
      session["gold"] = 0
      session['activities'] = []
    end
  end

  def farm
    farm = Farm.new
    session['activities'].push([farm.activity_str, farm.text_color])
    session["gold"] += farm.gold_earned
    redirect_to :index
  end

  def cave
    cave = Cave.new
    session['activities'].push([cave.activity_str, cave.text_color])
    session["gold"] += cave.gold_earned
    redirect_to :index
  end

  def house
    house = House.new
    session['activities'].push([house.activity_str, house.text_color])
    session["gold"] += house.gold_earned
    redirect_to :index
  end

  def casino
    casino = Casino.new
    session['activities'].push([casino.activity_str, casino.text_color])
    session["gold"] += casino.gold_earned
    redirect_to :index
  end
end
