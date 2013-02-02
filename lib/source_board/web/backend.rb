require 'sinatra'

module SourceBoard

  module Web

    class Backend < Sinatra::Base

      set :public_folder, File.join(File.dirname(__FILE__), 'public')

      get '/' do
        File.read(File.join(settings.public_folder, 'index.html'))
      end

      def self.start!
        # FIXME put these log files in proper locations
        $stderr.reopen(File.new('/tmp/source_board.stderr', 'w'))
        $stdout.reopen(File.new('/tmp/source_board.stdout', 'w'))
        # FIXME don't hardcode the port number
        exec('rackup', '-p', '20000', File.join(File.dirname(__FILE__), 'backend.ru'))
      end

    end

  end

end
