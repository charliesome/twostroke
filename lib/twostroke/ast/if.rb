require 'pry'
module Twostroke::AST
  class If < Base
    attr_accessor :condition, :then, :else
    
    def collapse
      pry binding if condition.nil? || @then.nil?
      self.class.new condition: condition.collapse, then: @then.collapse, else: @else && @else.collapse
    end
  end
end