# frozen_string_literal: true

require 'sinatra'
require 'json'

class Application < Sinatra::Base
  before do
    content_type 'application/json'
  end

  get '/status' do
    body 'In a good mood.'
  end

  get '/authentication-status' do
    body 'In a good mood.'
  end

  post '/login' do
    cognito_params = Cognito::Params::Login.build!(login_params)
    resp = identity_provider_client.admin_respond_to_auth_challenge(cognito_params)
    if resp.challenge_name == 'NEW_PASSWORD_REQUIRED'
      [200, {}, [{ code: 'NEW_PASSWORD_REQUIRED', session: resp.session }.to_json]]
    else
      ret = {
        access_token: resp.authentication_result.access_token,
        refresh_token: resp.authentication_result.refresh_token
      }
      [200, {}, [ret.to_json]]
    end
  end

  patch '/init_password' do
    cognito_params = Cognito::Params::InitPassword.build!(init_password_params)
    resp = identity_provider_client.admin_respond_to_auth_challenge(cognito_params)
    [200, {}, [resp.authentication_result.to_json]]
  end

  private

  def identity_provider_client
    @identity_provider_client ||= Aws::CognitoIdentityProvider::Client.new
  end

  def init_password_params
    {
      username: params[:username],
      new_password: params[:new_password],
      session: params[:session]
    }.merge!(request_infos)
  end

  def login_params
    {
      username: params[:username],
      password: params[:password]
    }.merge!(request_infos)
  end

  def request_infos
    {
      ip_address: request.ip,
      server_name: request.hostname,
      server_path: request.path,
      headers: [{}]
    }
  end
end
