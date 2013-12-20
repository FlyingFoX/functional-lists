require 'test_helper'
require 'functional/lists/singly_linked'

describe Functional::Lists::SinglyLinked do
  subject { Functional::Lists::SinglyLinked.new }

  describe "#unshift(object)" do
    describe "newly initialized" do
      before do
        subject.unshift "a"
      end
      it "must set the head to the tail" do
        subject.head.must_equal subject.tail
      end
      it "must set the head to a" do
        subject.head.object.must_equal "a"
      end
      it "must set the count" do
        subject.count.must_equal 1
      end
    end

    describe "with existing elements" do
      before do
        subject.unshift "a"
        subject.unshift "b"
        subject.unshift "c"
      end
      it "must leave the tail at a" do
        subject.tail.object.must_equal "a"
      end
      it "must set the head to c" do
        subject.head.object.must_equal "c"
      end
      it "must set the count" do
        subject.count.must_equal 3
      end
    end
  end

  describe "shift" do
    before do
      @shifted = subject.shift
    end

    describe "newly initialized" do
      it "must have a nil head and tail" do
        subject.head.must_equal nil
        subject.head.must_equal subject.tail
      end
      it "must return nil" do
        @shifted.must_equal nil
      end
      it "must have a 0 count" do
        subject.count.must_equal 0
      end
    end

    describe "with a existing elements" do
      before do
        subject.unshift "a"
        subject.unshift "b"
        subject.unshift "c"
        @shifted = subject.shift
      end
      it "must have a head of c" do
        subject.head.object.must_equal "c"
      end
      it "must have a tail of a" do
        subject.tail.object.must_equal "a"
      end
      it "must return the shifted head" do
        @shifted.must_equal "c"
      end
      it "must set the count" do
        subject.count.must_equal 2
      end
    end
  end

end

