require 'same_as/version'
require 'same_as/copy_fields'
require 'same_as/class_methods'

module SameAs
  class << self

    def included(base)
      base.send :extend, SameAs::ClassMethods
    end

  end
end
