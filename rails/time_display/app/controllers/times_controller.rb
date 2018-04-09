class TimesController < ApplicationController
    def main
        @current_time = Time.new
    end
end
