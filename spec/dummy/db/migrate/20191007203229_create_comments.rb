class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :emitter
      t.text :message
      t.references :entity, polymorphic: true, index: true
      t.references :comment, foreign_key: true, index: true 
      t.timestamps
    end
  end
end