require 'test_helper'
require 'functional/lists/singly_linked'

describe Functional::Lists::SinglyLinked do
  subject { Functional::Lists::SinglyLinked.new }

  describe "#push(object)" do
    describe "newly initialized" do
      before do
        subject.push "a"
      end
      it "must set the head to the tail" do
        subject.head.must_equal subject.tail
      end
      it "must set the tail to a" do
        subject.tail.object.must_equal "a"
      end
      it "must set the count" do
        subject.count.must_equal 1
      end
    end

    describe "with an existing element" do
      before do
        subject.push "a"
        subject.push "b"
      end
      it "must leave the head at a" do
        subject.head.object.must_equal "a"
      end
      it "must set the tail to b" do
        subject.tail.object.must_equal "b"
      end
      it "must set the count" do
        subject.count.must_equal 2
      end
    end
  end

  describe "pop" do
    before do
      @popped = subject.pop
    end

    describe "newly initialized" do
      it "must have a nil head and tail" do
        subject.head.must_equal nil
        subject.head.must_equal subject.tail
      end
      it "must return nil" do
        @popped.must_equal nil
      end
      it "must have a 0 count" do
        subject.count.must_equal 0
      end
    end

    describe "with a existing elements" do
      before do
        subject.push "a"
        subject.push "b"
        subject.push "c"
        @popped = subject.pop
      end
      it "must have a head of a" do
        subject.head.object.must_equal "a"
      end
      it "must have a tail of b" do
        subject.tail.object.must_equal "b"
      end
      it "must return the popped tail" do
        @popped.must_equal "c"
      end
      it "must set the count" do
        subject.count.must_equal 2
      end
    end
  end
end
