class StepsController < ApplicationController
  include Wicked::Wizard::Translated

  before_action :authenticate_user!

  steps(*User.steps)

  def show
    render_wizard
  end

  def update
    wizard_value = wizard_value(step)

    if wizard_value != "stage_5"
      if wizard_value >= current_user.highest_aasm_state
        current_user.complete_stage
      end

      wizard_path = current_user.highest_aasm_state.gsub("stage_", "")

      jump_to(wizard_path)
    end

    render_wizard current_user
  end
end
