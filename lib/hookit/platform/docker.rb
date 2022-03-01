module Hookit
  module Platform
    class Docker < Base
      
      def detect?
        ! `if [ -f "/.dockerenv" ] || [ -f "/.dockerinit" ] || \
          grep -qF /docker/ "/proc/self/cgroup" 2>/dev/null; then
            echo docker
        fi`.empty?
      end

      def name
        'docker'
      end

      def os
        'linux'
      end

    end
  end
end