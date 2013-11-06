require 'active_record'

module CustomHelpers
  def to_array_by_keys(keys)
    values = []
    obj_keys = self.attributes.keys
    keys.each do |key|
      values << self.send(key) if obj_keys.include?(key.to_s)
    end
    values
  end
end

module ActiveRecord
  class Base
    prepend CustomHelpers
  end
end


