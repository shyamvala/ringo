require 'spec_helper'

describe Ringo::Property do
  let(:name) { 'Status' }
  let(:value) { 'In Dev' }

  subject { Ringo::Property.new name, value }

  its(:name) { should == name }
  its(:value) { should == value }
end
