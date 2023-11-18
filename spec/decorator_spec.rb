require 'rspec'
require_relative '../lib/basedecorator'

describe BaseDecorator do
  let(:nameable) { double('Nameable', correct_name: 'John Doe') }
  subject { BaseDecorator.new(nameable) }

  it 'delegates correct_name to nameable' do
    expect(nameable).to receive(:correct_name)
    subject.correct_name
  end
end
