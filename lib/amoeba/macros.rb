module Amoeba
  module Macros
    module_function

    def list
      @list ||= {}
    end

    def add(klass)
      @list ||= {}
      key = klass.name.demodulize.underscore.to_sym
      @list[key] = klass
    end
  end
end
