# frozen_string_literal: true

class HashBuilder
  instance_methods.each do |m|
    undef_method m unless m =~ /(^__|^nil\?$|^send$|^object_id$)/
  end

  def initialize
    @hash = {}
    @target = @hash
  end

  def self.build!
    builder = HashBuilder.new
    yield builder
    builder.to_h
  end

  def to_h
    @hash
  end

  def inspect
    to_h.inspect
  end

  def attr!(key, value = nil)
    if block_given?
      parent = @target
      @target = {}
      yield
      parent[key] = @target
      @target = parent
    else
      @target[key] = value
    end
    @hash
  end

  def method_missing(key, value = nil, &block)
    attr!(key, value, &block)
  end
end

class Hash
  unless method_defined?(:build!)
    def build!(&block)
      ::HashBuilder.build!(&block)
    end
  end
end
