class CreateUrlManager < ActiveRecord::Migration[7.0]
  def change
    create_table :url_managers do |t|
      t.string :url, :null => false
      t.string :short_code, :null => false
      t.integer :alexa_rank, :default => 0
      t.integer :counter, :default => 0
      t.timestamps
    end
  end
end
