# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[8.1]
  def change
    # Rename password_digest to encrypted_password (Devise's column name)
    rename_column :users, :password_digest, :encrypted_password

    # Add Devise-specific columns
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :remember_created_at, :datetime

    # Add index for password reset tokens
    add_index :users, :reset_password_token, unique: true

    # Note: email column and index already exist, so we skip those

    ## Optional: Uncomment if you want these Devise features later

    # Trackable
    # add_column :users, :sign_in_count, :integer, default: 0, null: false
    # add_column :users, :current_sign_in_at, :datetime
    # add_column :users, :last_sign_in_at, :datetime
    # add_column :users, :current_sign_in_ip, :string
    # add_column :users, :last_sign_in_ip, :string

    # Confirmable
    # add_column :users, :confirmation_token, :string
    # add_column :users, :confirmed_at, :datetime
    # add_column :users, :confirmation_sent_at, :datetime
    # add_column :users, :unconfirmed_email, :string
    # add_index :users, :confirmation_token, unique: true

    # Lockable
    # add_column :users, :failed_attempts, :integer, default: 0, null: false
    # add_column :users, :unlock_token, :string
    # add_column :users, :locked_at, :datetime
    # add_index :users, :unlock_token, unique: true
  end
end
