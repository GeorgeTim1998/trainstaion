module InstanceCount
  module ClassMethods
    def instances
      @count
    end
  end

  module InstanceMethods
    protected
    
    def register_instance
      self.class.count += 1
    end
  end
end