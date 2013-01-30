require 'source_board/source_file'

module SourceBoard

  class SourceTree

    def initialize(directory)
      Dir.chdir(directory) do
        pipe = IO.popen('xargs file --mime-type', 'w+')
        Dir.glob('**/*').each do |f|
          pipe.puts(f)
        end
        pipe.close_write
        @files = pipe.readlines.map do |line|
          parts = line.strip.split(/:\s*/)
          SourceBoard::SourceFile.new(directory, parts[0]).tap do |file|
            file.mime_type = parts[1]
          end
        end
      end
    end

    attr_reader :files

    def [](path)
      # FIXME inefficient for large source trees (?)
      files.find do |f|
        f.path == path
      end
    end

  end

end
