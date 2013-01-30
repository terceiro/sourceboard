require 'source_board/configurator'

module SourceBoard

  class Language

    NONE = Object.new

    def initialize(name)
      @name = name
      @extensions = []
      @mime_type = nil
    end

    attr_reader :name
    attr_accessor :extensions, :mime_type

    def detect?(file)
      self.extensions.include?(file.extension) ||
        (self.mime_type && self.mime_type == file.mime_type)
    end

    def self.detect(file)
      all.find do |lang|
        lang.detect?(file)
      end || unknown
    end

    def self.push(lang)
      all << lang
    end

    def self.all
      @all ||= []
    end

    def self.unknown
      @unknown ||= Language.new('unknown')
    end

  end

end

def language(name, &block)
  lang = SourceBoard::Language.new(name)
  SourceBoard::Configurator.new(lang).instance_eval(&block)
  SourceBoard::Language.push(lang)
end

Dir.glob(File.join(File.dirname(__FILE__), 'language', '*.rb')).each do |f|
  require File.expand_path(f)
end
