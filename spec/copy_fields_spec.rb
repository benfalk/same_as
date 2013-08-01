require 'spec_helper'

module SameAs
  describe CopyFields do

    context 'Given -from- and -to- model definitions' do
      before :each do
        @from = double(:from)
        @to = double(:to)
        @from_attributes = %w( id a b c d created_at updated_at )
        @to_attributes = %w( id a b c e created_at updated_at )
        @from.stub(:attribute_names).and_return(@from_attributes)
        @to.stub(:attribute_names).and_return(@to_attributes)
      end

      it 'should match all fields excluding id, created_at, and updated_at' do
        @fields = CopyFields.new @from, @to
        @fields.should eq({ :a=>:a,:b=>:b,:c=>:c })
      end

      it 'should allow a specific set to match with an array' do
        @fields = CopyFields.new @from, @to, [:a,:c]
        @fields.should eq({ :a=>:a,:c=>:c })
      end

      it 'should allow a mapping of fields via a hash' do
        @fields = CopyFields.new @from, @to, {:a => :a, :b => :c, :d => :e}
        @fields.should eq({ :a => :a, :b => :c, :d => :e })
      end



    end


  end


end