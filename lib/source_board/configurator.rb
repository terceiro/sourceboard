module SourceBoard

  class Configurator < BasicObject

    def initialize(subject)
      @subject = subject
    end

    def method_missing(name, *values)
      if values.size > 1
        @subject.send("#{name}=", values)
      else
        @subject.send("#{name}=", values.first)
      end
    end

  end

end
