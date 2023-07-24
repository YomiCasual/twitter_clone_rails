class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.references :user, null: false, foreign_key: true
      t.text :body

      t.index [:user_id, :tweet_id], unique: true

      t.timestamps
    end
  end
end
