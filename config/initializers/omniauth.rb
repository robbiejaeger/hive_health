Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["google_oauth_client_id"], ENV["google_oauth_client_secret"],
    {
      :prompt => "select_account",
      :image_aspect_ratio => "square",
      :image_size => 50
    }
end
