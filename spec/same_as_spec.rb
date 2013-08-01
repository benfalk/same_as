require 'spec_helper'

describe SameAs do

  context 'when included in a model' do

    before :each do
      @model = Class.new
      @model.send :include, SameAs
    end

    it 'should have a singleton instance of "same_as"' do
      @model.singleton_methods.should include(:same_as)
    end

    describe 'the "same_as" method' do

      it 'creates an attr_accessible in the event one is not found' do
        @model.same_as :another
        @model.instance_methods.should include(:same_as_another)
        @model.instance_methods.should include(:same_as_another=)
      end

    end

  end





end