require 'spec_helper'

ROOT = File.expand_path(File.dirname(__FILE__))

class Dummy
  include RuGGby::Callback

  attr_accessor :actions

  def initialize
    @actions = {}
  end

end

describe RuGGby::Callback do
  subject { Dummy.new }

  context 'when we invoke on_new_message method' do
    it 'should assign a block to actions' do
      s = subject
      s.actions[:new_message].should == nil
      s.on_new_message do
        self
      end
      s.actions[:new_message].should_not == nil
    end
  end

  context 'when we invoke on_change_status method' do
    it 'should assign a block to actions' do
      s = subject
      s.actions[:change_status].should == nil
      s.on_change_status do
        self
      end
      s.actions[:change_status].should_not == nil
    end
  end
end
