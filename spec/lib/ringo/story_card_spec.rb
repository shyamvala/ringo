require 'spec_helper'

describe Ringo::StoryCard do
  let(:name) { 'Create user' }
  let(:number) { 101 }
  let(:properties) { [Ringo::Property.new('Status', 'In Development')] }

  subject { Ringo::StoryCard.new name, number, properties }

  its(:name) { should == name }
  its(:number) { should == number }
  its(:status) { should == 'In Development' }
  its(:to_emit) { should == '#101 - Create user' }
  it { subject.to_emit(5).should == '#101 -' }
  its(:to_hash) { should == Hash[name: name, number: number, status: 'In Development'] }
end
