class TokensController < ApplicationController
  def verify
    oauth_token = OauthToken.find_by_token(params[:token])
    
    is_token_valid = false if !oauth_token
    is_token_valid = true if oauth_token && oauth_token.authorized?
        
    render :json => "{\"token\":\"#{params[:token]}\", \"valid\": #{is_token_valid} }"
  end
end
