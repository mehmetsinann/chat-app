class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.boolean :is_admin, :default => false
      t.datetime :last_seen_at
      t.string :password_digest

      t.timestamps
    end
  end
end
