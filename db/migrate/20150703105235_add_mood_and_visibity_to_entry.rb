class AddMoodAndVisibityToEntry < ActiveRecord::Migration
  def change
  	add_column :entries, :mood, :string
  	add_column :entries, :visibility, :string
  end
end
