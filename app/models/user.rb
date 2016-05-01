class User < ApplicationRecord
  include Authenticatable
  include Steppable

  enum aasm_state: {
    stage_1:  1,
    stage_2:  10,
    stage_3:  100,
    stage_4:  1_000,
    stage_5:  10_000
  }

  aasm do
    state :stage_1, initial: true
    state :stage_2
    state :stage_3
    state :stage_4
    state :stage_5

    event :complete_stage, after: :set_highest_aasm_state do
      transitions from: :stage_1, to: :stage_2
      transitions from: :stage_2, to: :stage_3
      transitions from: :stage_3, to: :stage_4
      transitions from: :stage_4, to: :stage_5
    end
  end

  private

  def set_highest_aasm_state
    if aasm.current_state.to_s >= highest_aasm_state
      update(highest_aasm_state: aasm.current_state)
    end
  end
end
