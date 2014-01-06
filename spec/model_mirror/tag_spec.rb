describe 'Tag' do

  it 'should validate presence' do
    t = Tag.new(:name, ActiveModel::Validations::PresenceValidatior)
    t.options.should include('parsley-required')
  end

end
