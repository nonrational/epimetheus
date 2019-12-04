class CreateDecisions < ActiveRecord::Migration[6.0]
  def change
    create_table :decisions, id: :uuid do |t|
      t.string :name
      t.datetime :decided_at
      t.datetime :for_review_at
      t.text :situation
      t.text :decision
      t.text :alternatives
      t.text :problem_statement
      t.text :variables
      t.text :complications

      t.timestamps
    end

    create_table :material_states, id: :uuid do |t|
      t.string :name
      t.string :type

      t.timestamps
    end

    create_table :decision_material_states, id: :uuid do |t|
      t.references :decision, null: false, foreign_key: true, type: :uuid
      t.references :material_state, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    create_table :outcomes, id: :uuid do |t|
      t.references :decision, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    create_table :expectations, id: :uuid do |t|
      t.references :decision, null: false, foreign_key: true, type: :uuid
      t.text :description
      t.decimal :likelihood
      t.decimal :desirability
      t.timestamps
    end
  end
end
