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
            'path'      => file.path,
            'name'      => File.basename(file.path),
            'metrics'   => {
              'loc'     => loc_data[file.path],
              'nom'     => def_data[file.path] || 0,
            },
          }
        end
      end

      private

      def process_with_wc(source_tree)
        process_pipe(source_tree, 'xargs wc -l') do |data,line|
          loc, path = line.split
          data[path] = loc.to_i
        end
      end

      def process_with_ctags(source_tree)
        process_pipe(source_tree, 'xargs ctags -x') do |data,line|
          tag, kind, line_number, path, signature = line.split
          data[path] ||= 0
          if ["member", "function", "method"].include?(kind)
            data[path] += 1
          end
        end
      end

      def process_pipe(source_tree, command)
        pipe = IO.popen(command, 'w+')
        source_tree.files.each do |source_file|
          pipe.puts source_file.path
        end
        pipe.close_write
        data = {}
        pipe.each_line do |line|
          yield(data, line)
        end
        pipe.close
        data
      end

    end

  end

end
