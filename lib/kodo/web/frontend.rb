module Kodo

  module Web

    module Frontend

      def self.run!
        datadir = File.join(Dir.home, '.cache', 'kodo', 'chromium')
        system('chromium', '--app=' + 'http://localhost:20000/', '--user-data-dir=' + datadir)
      end

    end

  end

end
