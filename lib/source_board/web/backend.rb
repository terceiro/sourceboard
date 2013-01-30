require 'sinatra'

module SourceBoard

  module Web

    class Backend < Sinatra::Base

      get '/' do
        "<html>
        <head>
          <title>source_board</title>
        </head>
        <body>
        </body>
      </html>"
      end

      def self.start!
        # FIXME put these log files in proper locations
        $stderr.reopen(File.new('/tmp/source_board.stderr', 'w'))
        $stdout.reopen(File.new('/tmp/source_board.stdout', 'w'))
        exec('rackup', '-p', '20000', File.join(File.dirname(__FILE__), 'backend.ru'))
      end

    end

  end

end
