require 'spec_helper'

describe Tag do
  
  let!(:tag) do
    user = User.new
    Tag.new(user.name, user.class.validators_on(:name).map { |e| { type: e, options: e.options } })
  end

  it 'should validate presence' do
    tag.options.should include('parsley-required')
  end

  it 'should validate min and max lengths' do
    tag.options.should include('parsley-rangelength')
  end

  it 'should validate numericality' do
    tag.options.should include('parsley-type')
  end

  it 'should include an error message for numericality' do
    tag.options.should include('parsley-error-message')
  end
end
