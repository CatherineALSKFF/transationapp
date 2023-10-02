class ApplicationController < ActionController::API

    def ping
        render plain: 'Pong!'
      end
end
