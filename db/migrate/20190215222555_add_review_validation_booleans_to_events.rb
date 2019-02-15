class AddReviewValidationBooleansToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :reviewed, :boolean, default: false
    add_column :events, :validated, :boolean, default: false
  end
end
