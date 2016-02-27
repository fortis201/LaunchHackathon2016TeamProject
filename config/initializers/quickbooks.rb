OAUTH_CONSUMER_KEY = "qyprdlVIm3r8WhZvphZLNgtNVRu3yC"
OAUTH_CONSUMER_SECRET = "xpkzbDWKjIA3fQkqUtv67426QZBYQWkF3bzZ1jfP"

::QB_OAUTH_CONSUMER = OAuth::Consumer.new(OAUTH_CONSUMER_KEY, OAUTH_CONSUMER_SECRET, {
    :site                 => "https://oauth.intuit.com",
    :request_token_path   => "/oauth/v1/get_request_token",
    :authorize_url        => "https://appcenter.intuit.com/Connect/Begin",
    :access_token_path    => "/oauth/v1/get_access_token"
})
