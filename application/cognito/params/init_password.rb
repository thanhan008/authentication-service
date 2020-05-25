# frozen_string_literal: true

module Cognito
  module Params
    # Build parameters to init an user password on Congnito.
    class InitPassword < Default
      def self.build!(params)
        super do |h|
          h.challenge_responses do
            h.USERNAME params[:username]
            h.NEW_PASSWORD params[:new_password]
          end
          h.challenge_name 'NEW_PASSWORD_REQUIRED'
          h.session params[:session]
        end
      end
    end
  end
end
