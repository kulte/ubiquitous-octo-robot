class StepPolicy < Struct.new(:user, :step)
  User.steps.each do |state|
    define_method("show_#{state}?") do
      user.aasm_state >= state.to_s
    end
  end
end
