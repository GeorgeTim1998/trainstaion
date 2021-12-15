module InstanceCount
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      @count ||= 0
    end
  end

  module InstanceMethods
    protected
    
    def register_instance
      self.class.count ||= 0
      self.class.count += 1
    end
  end
end