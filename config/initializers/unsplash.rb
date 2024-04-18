Unsplash.configure do |config|
    config.application_access_key = ENV['UNSPLASH_ACCESS_KEY']
    config.application_secret = ENV['UNSPLASH_SECRET_KEY']
    config.application_redirect_uri = ENV['UNSPLASH_REDIRECT_URI']
    config.utm_source = "alices_terrific_client_app"
  
end
