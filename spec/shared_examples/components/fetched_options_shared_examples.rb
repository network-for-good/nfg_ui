# required `let` examples:
# let(:tested_option) { :theme }
#
# Example usage:
#
# describe '#height' do
#   let(:tested_option) { :height }
#   subject { component.height }
#   it_behaves_like 'a fetched option with a defined fallback', fallback: nil
# end

shared_examples_for 'a fetched option with a defined fallback' do |fallback: nil|
  let(:options) { { tested_option => tested_value } }

  it_behaves_like 'an option with a value'

  context 'when the tested option is false in the :options hash' do
    let(:tested_value) { false }
    it { is_expected.not_to be }
  end

  context 'when the option is nil in the :options hash' do
    let(:tested_value) { nil }
    it { is_expected.to be_nil }
  end

  context 'when the tested option is not present in the :options hash' do
    let(:options) { {} }
    it { is_expected.to eq fallback }
  end
end

shared_examples_for 'an option with a value' do |fallback: nil|
  let(:options) { { tested_option => tested_value } }

  context 'when the tested option is true in the :options hash' do
    let(:tested_value) { true }
    it { is_expected.to be }
  end

  context 'when the teste option is a symbol in the :options hash' do
    let(:tested_value) { :tested_value }
    it { is_expected.to eq tested_value }
  end

  context 'when the teste option is a string in the :options hash' do
    let(:tested_value) { 'tested value' }
    it { is_expected.to eq tested_value }
  end

  context 'when the tested option is a hash in the :options hash' do
    let(:tested_value) { { 'tested_value_key' => 'value' } }
    it { is_expected.to eq tested_value }
  end

  context 'when the tested option is an array in the :options hash' do
    let(:tested_value) { %w[another tested array] }
    it { is_expected.to eq tested_value }
  end
end