Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_OAUTH_CLIENT_ID"], ENV["GOOGLE_OAUTH_CLIENT_SECRET"],
    {
      :prompt => "select_account",
      :image_aspect_ratio => "square",
      :image_size => 50
    }
end