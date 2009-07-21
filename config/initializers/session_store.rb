# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_media_session',
  :secret      => '8e0c7754c14bc4c51cbaf43e5b2214f2bc8b39fe623c4fb37dd074b0b511dd8a03c7cf1cfbcdeecb9b3c711d719bc7ca5d503c81cc976c5c215893a47a33ee43'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
