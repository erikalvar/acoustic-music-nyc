class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.string :venue
      t.string :venue_address
      t.string :tickets_url
      t.text :description
      t.integer :user_id
      t.integer :moderator_id
      t.string :image_url

      t.timestamps
    end
  end
end
