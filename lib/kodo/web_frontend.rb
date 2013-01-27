require 'sinatra'

module Kodo

  class WebFrontend < Sinatra::Base
    get '/' do
      "<html>
        <head>
          <title>kodo</title>
        </head>
        <body>
        </body>
      </html>"
    end
  end

end
