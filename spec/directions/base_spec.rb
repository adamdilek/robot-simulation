describe Directions::Base do
  it 'does not set identifier' do
    klass = Directions::Base

    expect(klass.identifier).to eq('BASE')
  end

  it 'has forward unit value' do
    klass = Directions::Base

    expect { klass.forward_unit }.to raise_error(CustomErrors::MustBeImplemented)
  end
end