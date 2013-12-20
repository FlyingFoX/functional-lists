require 'test_helper'
require 'functional/lists/singly_linked'

describe "SinglyLinked" do
  subject { Functional::Lists::SinglyLinked.new }

  describe "#<<" do
    it "is an alias for push" do
      subject << "1"
      subject.head.object.must_equal "1"
    end
  end

  describe "#push(object)" do
    it "must put the new object @ head" do
      subject.push("a")
      subject.head.object.must_equal "a"
      subject.tail.object.must_equal "a"

      subject.push "b"
      subject.head.object.must_equal "b"
      subject.tail.object.must_equal "a"

      subject.push "c"
      subject.head.object.must_equal "c"
      subject.tail.object.must_equal "a"
    end

    it "must keep the tail" do
      subject.push "a"
      subject.push "b"
      subject.push "c"
      subject.tail.object.must_equal "a"
    end

    it "must set the next pointer" do
      subject.push("a")
      subject.head.object.must_equal "a"

      subject.push("b")
      subject.head.object.must_equal "b"
      subject.head.next.object.must_equal "a"

      subject.push("c")
      subject.head.object.must_equal "c"
      subject.head.next.object.must_equal "b"
      subject.tail.object.must_equal "a"
    end

    it "must increment the count" do
      subject.push "a"
      subject.count.must_equal 1
      subject.push "b"
      subject.count.must_equal 2
    end
  end

  describe "#pop" do
    it "must pull and return the last element on the list" do
      subject.push "a"
      subject.push "b"
      subject.push "c"
      old_size = subject.count
      subject.pop.must_equal "a"
      subject.count.must_equal old_size-1
    end
  end

  describe "#unshift" do
    it "must add the element to the head of the list" do
      subject.unshift "a"
      subject.unshift "b"
      subject.head.object.must_equal "b"
    end
  end
  
  describe "#shift" do
    it "must add the element to the head of the list" do
      subject.unshift "a"
      subject.unshift "b"
      subject.shift.must_equal "b"
    end
  end

  describe "#to_a" do
    subject { Functional::Lists::SinglyLinked.new }
    before { 5.times {|i| subject.push i+1 } }
    it "must place all nodes into an array" do
      subject.to_a.map(&:object).must_equal [1,2,3,4,5]
    end
  end
end

