require 'rspec'
require_relative '../lib/basedecorator'
require_relative '../lib/trimmerdecorator'
require_relative '../lib/capitalizedecorator'

describe 'Decorator Classes' do
  let(:nameable) { double('Nameable', correct_name: 'John Doe') }

  describe BaseDecorator do
    subject { BaseDecorator.new(nameable) }

    it 'delegates correct_name to nameable' do
      expect(nameable).to receive(:correct_name)
      subject.correct_name
    end
  end

  describe TrimDecorator do
    subject { TrimDecorator.new(nameable) }

    it 'trims the correct_name to 10 characters' do
      expect(subject.correct_name).to eq('John Doe')
    end
  end

  describe CapitalizeDecorator do
    subject { CapitalizeDecorator.new(nameable) }

    it 'capitalizes the correct_name' do
      expect(subject.correct_name).to eq('John doe')
    end
  end
end
