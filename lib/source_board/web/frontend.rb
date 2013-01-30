module Kodo

  module Web

    module Frontend

      def self.run!
        # FIXME here we should just open a GTK3 application with a webkit
        # container inside. This does the trick for now
        datadir = File.join(Dir.home, '.cache', 'kodo', 'chromium')
        system('chromium', '--app=' + 'http://localhost:20000/', '--user-data-dir=' + datadir)
      end

    end

  end

end
