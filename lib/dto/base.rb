class DTO::Base
  def initialize(data)
    @data = data
  end

  def to_hash
    @data.dup
  end

  def self.attrs(*properties)
    not_allowed_methods = self.public_instance_methods & properties

    raise ArgumentError, "Attribute #{not_allowed_methods} is already in use by any instance of parent class! Use other unreserved name." if not_allowed_methods.any?

    properties.each { |name| define_attribute(name) }

    class_eval %Q(
      def initialize(data)
        @data = data.select { |key, _| self.class.properties.include?(key) }
      end
    )
  end

  def self.properties
    @properties ||= []
  end

  def self.define_attribute(name)
    properties.push(name)

    define_method(name) do
      get_attribute(name)
    end

    define_method("#{name}=") do |value = nil|
      set_attribute(name, value)
    end
  end

  private

  def get_attribute(name)
    @data[name]
  end

  def set_attribute(name, value)
    raise ArgumentError, "Property #{name} is not defined for #{self.class} class!" unless property_defined?(name)

    @data[name] = value
  end

  def property_defined?(name)
    @data.keys.include?(name)
  end
end