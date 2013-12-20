require 'test_helper'
require 'functional/lists/singly_linked'

describe Functional::Lists::SinglyLinked do
  subject { Functional::Lists::SinglyLinked.new }

  describe "#to_a" do
    it "must convert to array" do
      subject.push "a"
      subject.push "b"
      subject.to_a.must_equal ["b", "a"]
    end
  end

end

