module SameAs

  ##
  # Describes what fields should be copied from one model to another
  # based on the model to copy from to the target model to copy to.
  # By default will greedily match all fields that share similar
  # names; except for the model id and timestamp fields
  #
  class CopyFields < ::Hash

    ##
    # Raised when the fields parameter can't be determined
    #
    class UnknownFieldStrategy < ::Exception; end

    ##
    # Common fields that need to be ignored on models for a copy
    #
    FIELDS_TO_IGNORE = [ :id, :created_at, :updated_at ]

    ##
    # Initialized by the class object from which fields are copied
    # to and from, along with an optional list or hash of fields
    # that should be specifically copied over
    #
    # === Parameters
    #
    # 1) from:: the class model to copy from
    # 2) to:: the class model to copy to
    # 3) fields:: can be one of three values
    #
    # * :* - Greedily grabs all similar fields
    # * Array - list of fields that both models share
    # * Hash - maps model fields, the key being the from model and
    # the key pointing to the target model
    #
    def initialize(from,to,fields=:*)
      super()
      from = from.attribute_names.map(&:to_sym) - FIELDS_TO_IGNORE
      to = to.attribute_names.map(&:to_sym) - FIELDS_TO_IGNORE
      self.merge!(
        case fields
          when :*
            array_to_hash(from & to)
          when Array
            array_to_hash(from & to & fields.map(&:to_sym))
          when Hash
            symbolize_hash(fields).select do |key,value|
              from.include?(key) && to.include?(value)
            end
          else
            raise UnknownFieldStrategy
        end
      )
      self.freeze
    end

    private

    ##
    # Returns an array into a hash were each value in the array
    # becomes the key AND value for each hash pair
    #
    def array_to_hash(arr)
      #noinspection RubyHashKeysTypesInspection
      Hash[*(arr*2).sort]
    end

    ##
    # Returns a hash each each key and value is converted to
    # a symbol
    #
    def symbolize_hash(hash)
      {}.tap do |h|
        hash.each { |k,v| h.merge!({k.to_sym => v.to_sym}) }
      end
    end


  end


end