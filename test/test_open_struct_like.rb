# frozen_string_literal: true

require "test_helper"

describe OpenStructLike do
  class OpenStructLikeClient
    include OpenStructLike
  end

  let(:obj) { OpenStructLikeClient.new }

  def test_that_it_has_a_version_number
    refute_nil ::OpenStructLike::VERSION
  end

  describe "various get/set techniques" do
    it do
      obj.foo = :foo
      obj[:bar] = :bar
      obj["baz"] = :baz
      assert_equal obj["foo"], :foo
      assert_equal obj.bar, :bar
      assert_equal obj[:baz], :baz
    end
  end

  describe "#keys" do
    it do
      obj.foo = :foo
      obj[:bar] = :bar
      obj["baz"] = :baz
      assert_equal obj.keys, %w[foo bar baz]
    end
  end

  describe "#values" do
    it do
      obj.foo = 'a'
      obj[:bar] = '1'
      obj["baz"] = 3
      assert_equal obj.values, ['a', '1', 3]
    end
  end

  describe "#to_h,#attributes" do
    it do
      obj.foo = 'a'
      obj[:bar] = '1'
      obj["baz"] = 3
      assert_equal obj.to_h, { 'foo' => 'a', 'bar' => '1', 'baz' => 3 }
      assert_equal obj.attributes, { 'foo' => 'a', 'bar' => '1', 'baz' => 3 }
    end
  end
end
