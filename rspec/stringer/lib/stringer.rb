require "stringer/version"

module Stringer
    def self.spacify *strings
        string = ""
        strings.each do |s|
            string += " " + s
        end
        string.strip
    end

    def self.minify str, length
      if str.length > length
        return str[0...length] + '...'
      end
      str
    end

    def self.replacify str, to_replace, replace_with
      str.gsub to_replace, replace_with
    end

    def self.tokenize str
      str.split(" ")
    end

    def self.removify str, to_remove
      str.gsub! to_remove, ""
      split_str = str.split(" ")
      split_str.join(" ")
    end

    
end