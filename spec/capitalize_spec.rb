require 'rspec'
require_relative '../lib/capitalizedecorator'

describe CapitalizeDecorator do
  let(:nameable) { double('Nameable', correct_name: 'John Doe') }
  subject { CapitalizeDecorator.new(nameable) }

  it 'capitalizes the correct_name' do
    expect(subject.correct_name).to eq('John doe')
  end
end
