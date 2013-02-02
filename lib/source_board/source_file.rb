require 'source_board/language'

module SourceBoard

  class SourceFile

    def initialize(root, path)
      @path = path
      @full_path = File.join(root, path)
    end

    attr_reader :path, :full_path
    attr_accessor :mime_type

    def extension
      @extension ||= File.basename(path).split('.').last
    end

    def executable?
      File.executable?(full_path)
    end

    def ==(other)
      other.is_a?(SourceFile) && other.full_path == self.full_path
    end

    def language
      @language ||= SourceBoard::Language.detect(self)
    end

  end

end
