# frozen_string_literal: true

module Cognito
  module Params
    class Login < Default
      def self.build!(params)
        super do |h|
          h.challenge_name 'ADMIN_NO_SRP_AUTH'
          h.challenge_responses do
            h.USERNAME params[:username]
            h.PASSWORD params[:password]
          end
          h.session 'RespondToAuthChallenge'
        end
      end
    end
  end
end
