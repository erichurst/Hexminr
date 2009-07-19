# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_colorthing_session',
  :secret      => '228835467553e7d9940b8fed00c2bf6d327b0dd6f97d5c3882f801c675c64d1edd582a699b5d84a019879b74e8f0416e5cdbfc075b2cab6f4a5a8ffa146e55cd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
