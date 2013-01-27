require 'sinatra'

module Kodo

  module Web

    class Backend < Sinatra::Base

      get '/' do
        "<html>
        <head>
          <title>kodo</title>
        </head>
        <body>
        </body>
      </html>"
      end

      def self.start!
        exec('rackup', '-p', '20000', File.join(File.dirname(__FILE__), 'backend.ru'))
      end

    end

  end

end
