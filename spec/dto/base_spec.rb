require 'spec_helper'

describe DTO::Base do
  let(:dto_class) {
    Class.new(DTO::Base) do
      attrs :test, :example, :sample
    end
  }
  let(:dto) { dto_class.new(test: 'test', example: 1, sample: false) }
  let(:dto_hash) { { test: 'test', hello: :world } }

  context ':attrs' do
    context 'for methods already in use' do
      it 'raises ArgumentError' do
        expect {
          dto_class.attrs :class
        }.to raise_error(ArgumentError, "Attribute [:class] is already in use by any instance of parent class! Use other unreserved name.")
      end
    end
  end
  
  context '#initialize' do
    context 'from keyword arguments' do
      it 'init new instance with passed attributes' do
        expect(dto.test).to eq('test')
        expect(dto.example).to eq(1)
        expect(dto.sample).to be(false)
      end
    end

    context 'from hash' do
      let(:dto_from_hash) { dto_class.new(dto_hash) }
      
      it 'uses only allowed params' do
        expect(dto_from_hash.test).to eq('test')
      end

      it 'returns nil from unset params' do
        expect(dto_from_hash.example).to be_nil
      end

      it 'not affect to other instances of class' do
        dto_from_hash.example
        
        expect(dto.example).to eq(1)
      end
    end
  end

  context 'when update attributes' do
    it 'not raises error' do
      expect { dto.test = 'new_value' }.to_not raise_error
    end

    it 'sets new values' do
      dto.test = 'new_value'
      
      expect(dto.test).to eq('new_value')
    end
  end
end