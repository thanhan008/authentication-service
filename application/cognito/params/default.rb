# frozen_string_literal: true

module Cognito
  module Params
    # Build basic paramters for login via Cognito
    # https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/CognitoIdentityProvider/Client.html#admin_respond_to_auth_challenge-instance_method
    class Default
      def self.build!(params)
        HashBuilder.build! do |h|
          h.user_pool_id ENV['COGNITO_USER_POOL_ID']
          h.client_id ENV['COGNITO_CLIENT_ID']
          h.analytics_metadata do
            h.analytics_endpoint_id 'AdminRespondToAuthChallenge'
          end
          h.context_data do
            h.ip_address params[:ip_address]
            h.server_name params[:server_name]
            h.server_path params[:server_path]
            h.http_headers params[:headers]
          end
          yield h
        end
      end
    end
  end
end
