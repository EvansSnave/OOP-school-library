require 'rspec'
require_relative '../lib/capitalizedecorator'


let(:nameable) { double('Nameable', correct_name: 'John Doe') }
describe CapitalizeDecorator do
  subject { CapitalizeDecorator.new(nameable) }

  it 'capitalizes the correct_name' do
    expect(subject.correct_name).to eq('John doe')
  end
end
