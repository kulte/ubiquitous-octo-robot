module Steppable
  extend ActiveSupport::Concern

  included do
    include AASM

    class << self
      def steps
        aasm.states.map(&:name)
      end
    end
  end
end
