class AddAasmStateAndHighestAasmStateToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :aasm_state, :integer, default: 1
    add_column :users, :highest_aasm_state, :string, default: "stage_1"
  end
end
