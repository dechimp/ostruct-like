# frozen_string_literal: true

# require_relative "open_struct_like/version"

require 'ostruct'
require 'active_support/core_ext/hash/indifferent_access'

module OpenStructLike
  attr_accessor :_os

  def method_missing(method, *args, &block)
    init_data
    @_os.send(method, *args, &block)
  end

  def keys
    init_data
    to_h.keys
  end

  def values
    init_data
    to_h.values
  end

  def to_h
    init_data
    @_os.to_h.with_indifferent_access
  end
  alias attributes to_h

  def init_data
    @_os = OpenStruct.new unless @_os
    @_os
  end
end
