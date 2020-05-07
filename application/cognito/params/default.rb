# frozen_string_literal: true

module Cognito
  module Params
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
