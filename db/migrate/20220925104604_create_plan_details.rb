class CreatePlanDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :plan_details do |t|
      t.date :spot_date
      t.time :start_time
      t.time :end_time
      t.string :destination
      t.text :spot_content
      t.integer :movement
      t.references :plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
