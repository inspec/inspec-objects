# frozen_string_literal: true

module Inspec::Object
  class OrTest
    attr_reader :tests
    def initialize(tests)
      @tests = tests
      @negated = false
    end

    def skip
      nil
    end

    def negate!
      @negated = !@negated
    end

    def to_ruby
      if @negated
        # We don't use the describe.one wrapper when negated because:
        # !(test1 || test2)     same as    (!test1 && !test2)    where && is implicit in inspec
        @tests.map do |test|
          test.negate!
          test
        end.map(&:to_ruby).join("\n")

      else
        all_tests = @tests.map(&:to_ruby).join("\n").gsub("\n", "\n  ")

        format("describe.one do\n  %s\nend", all_tests)
      end
    end

    def to_hash
      { describe_one: @tests.map(&:to_hash) }
    end
  end
end
