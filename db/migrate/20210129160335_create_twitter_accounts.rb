class CreateTwitterAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :twitter_accounts do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.string :username
      t.string :image
      t.string :token
      t.string :secret

      t.timestamps
    end
  end
end
