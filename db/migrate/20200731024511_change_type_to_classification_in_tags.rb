class ChangeTypeToClassificationInTags < ActiveRecord::Migration[6.0]
  def change
    rename_column :tags, :type, :classification
  end
end
