class CreateFighters < ActiveRecord::Migration
  def change
    create_table :fighters do |t|
      t.integer :body
      t.integer :quickness
      t.integer :strength
      t.integer :charisma
      t.integer :intelligence
      t.integer :willpower
      t.integer :essence
      t.integer :magic
      t.integer :initiative
      t.string :name

      t.timestamps
    end
  end
end
