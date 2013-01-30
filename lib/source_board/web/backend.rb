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
        # FIXME put these log files in proper locations
        stderr.reopen(File.new('/tmp/kodo.stderr', 'w'))
        $stdout.reopen(File.new('/tmp/kodo.stdout', 'w'))
        exec('rackup', '-p', '20000', File.join(File.dirname(__FILE__), 'backend.ru'))
      end

    end

  end

end
