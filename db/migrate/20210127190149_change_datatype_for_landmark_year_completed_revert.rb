class ChangeDatatypeForLandmarkYearCompletedRevert < ActiveRecord::Migration
  def change
    change_column :landmarks, :year_completed, :datetime
  end
end
