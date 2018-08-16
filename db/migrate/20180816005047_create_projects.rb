class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :client_id
      t.string :name
      t.string :description
      t.date :project_completion
    end
  end
end
