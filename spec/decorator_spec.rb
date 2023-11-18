require 'rspec'
require_relative '../lib/basedecorator'

let(:nameable) { double('Nameable', correct_name: 'John Doe') }

describe BaseDecorator do
  subject { BaseDecorator.new(nameable) }

  it 'delegates correct_name to nameable' do
    expect(nameable).to receive(:correct_name)
    subject.correct_name
  end
end
