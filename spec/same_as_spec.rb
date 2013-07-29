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

    end

  end





end