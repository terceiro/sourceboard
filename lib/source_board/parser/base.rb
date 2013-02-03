module SourceBoard

  module Parser

    class Base

      # Parses the source tree passed in as argument, extracting source code
      # metrics. +source_tree+ is an instance or SourceBoard::SourceTree
      #
      # The return value must be an array of hashes. Each hash represents an
      # element of the source code, and must have at least the following
      # (symbol) keys:
      #
      # +:name+:: a human-friendly name of the element
      #
      # +:id+:: the fully qualified name of the element, using slashes to
      #         indicate nesting. For example. a Ruby class +Foo::Bar+ must be
      #         represented as +Foo/Bar+; a Python module foo.bar must be
      #         represented by +foo/bar+, and so on.
      #
      # +:file+:: path of the file containing the element, relative to the root
      #           of the project source tree.
      #
      # +:metrics+::  a hash containing metrics for the given element. +:loc+
      #               and +:number_of_definitions+ are mandatory metrics and
      #               therefore these keys must be present, but a parser may
      #               provide any other metrics. The hash values must be
      #               numbers.
      #
      # The following keys are optional:
      #
      # +:line+:: the line in which the element starts at the corresponding
      #           source. This will be used when opening the file in a text
      #           editor. If omitted, the editor will open with the cursor at
      #           its default position (usually the first line of the file).
      #
      # This method must be overriden by subclasses.
      def parse!(source_tree)
      end

      # Indicates whether parser instance works with that given language.
      #
      # This method must be overriden by subclasses.
      def accept?(language)
        true
      end

      # Returns a list of symbols indicating the names of the metrics supported
      # by this parser. At least +loc+ (lines of code) and
      # +number_of_definitions+ (a generalization of "number of methods") must
      # be supported.
      #
      # This method may be overriden by subclasses.
      #
      def metrics
        [ :loc, :number_of_definitions ]
      end

    end

  end

end
