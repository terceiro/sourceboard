require 'source_board/parser/base'

module SourceBoard

  module Parser

    class Simple < Base

      def parse!(source_tree)
        loc_data = Dir.chdir(source_tree.directory) do
          process_with_wc(source_tree)
        end
        def_data = Dir.chdir(source_tree.directory) do
          def_data = process_with_ctags(source_tree)
        end
        source_tree.files.map do |file|
          {
            'id'        => file.path,
            'name'      => File.basename(file.path),
            'metrics'   => {
              'loc'                   => loc_data[file.path],
              'number_of_definitions' => def_data[file.path],
            },
          }
        end
      end

      private

      def process_with_wc(source_tree)
        pipe = IO.popen('xargs wc -l', 'w+')
        source_tree.files.each do |source_file|
          pipe.puts source_file.path
        end
        pipe.close_write
        data = {}
        pipe.each_line do |line|
          loc, path = line.split
          data[path] = loc.to_i
        end
        data
      end

      def process_with_ctags(source_tree)
        pipe = IO.popen('xargs ctags -f -', 'w+')
        source_tree.files.each do |source_file|
          pipe.puts source_file.path
        end
        pipe.close_write
        data = {}
        pipe.each_line do |line|
          tag, path = line.split
          data[path] ||= 0
          data[path] += 1
        end
        data
      end

    end

  end

end
