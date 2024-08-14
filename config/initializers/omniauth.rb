Rails.application.config.middleware.use OmniAuth::Builder do
  #middleware uses OmniAuth which used for authentication
  provider :twitter, Rails.application.credentials.dig(:twitter, :api_key), Rails.application.credentials.dig(:twitter, :api_secret)
  OmniAuth.config.logger = Rails.logger
  #Logs geenrated by OmniAuth are sent to the Rails
end
