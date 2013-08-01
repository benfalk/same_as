##
# == Module Overview
#
# This module is where all class methods reside that add to the ActiveRecord
# DSL methods available to your model
#
module SameAs::ClassMethods

  #TODO: This works... it's messy and needs some serious refactoring & cleanup

  ##
  # Allows a model to be described as sharing the same data as another model
  #
  def same_as(model,opts={})

    defaults = {
        :from => :self,
        :when => "same_as_#{model}".to_sym,
        :fields => :*
    }

    opts = defaults.merge(opts)

    attr_accessor opts[:when] unless instance_methods.include? opts[:when]

    send :before_save do

      return true unless send(opts[:when])

      delegate = opts[:from] == :self ? self : send(opts[:from])

      from = delegate.send(model)

      return true unless from

      ::SameAs::CopyFields.new(from.class, self.class, opts[:fields]).each do |fro,to|
        send("#{to}=", from.send(fro))
      end

    end

  end

end