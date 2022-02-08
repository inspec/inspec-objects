# frozen_string_literal: true

module Inspec::Object
  class Value
    include ::Inspec::Object::RubyHelper

    attr_accessor :qualifier
    attr_accessor :skip
    attr_accessor :variable

    def initialize(qualifiers = [])
      @qualifier = qualifiers
      @variable = nil
    end

    def to_ruby
      res = @variable.nil? ? "" : "#{@variable} = "
      res + @qualifier.map { |x| ruby_qualifier(x) }.join(".")
    end

    def name_variable(cache = [])
      @variable = Array("a".."z").find { |x| !cache.include?(x) }
      cache.push(@variable)
      @variable
    end
  end
end
