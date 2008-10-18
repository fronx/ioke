include_class('ioke.lang.Runtime') { 'IokeRuntime' } unless defined?(IokeRuntime)

import Java::java.io.StringReader unless defined?(StringReader)

describe "core" do 
  describe "nil" do 
    it "should have the correct kind" do 
      runtime = IokeRuntime.get_runtime
      result = runtime.nil.find_cell(nil, nil, "kind")
      result.data.text.should == 'nil'
    end

    it "should not be possible to mimic" do 
      runtime = IokeRuntime.get_runtime
      proc do 
        runtime.evaluate_stream(StringReader.new("nil mimic"))
      end.should raise_error
    end
    
    it "should act as false in if statement" do 
      runtime = IokeRuntime.get_runtime
      runtime.evaluate_stream(StringReader.new("if(nil, 42, 43)")).
        data.as_java_integer.should == 43
    end
  end

  describe "false" do 
    it "should have the correct kind" do 
      runtime = IokeRuntime.get_runtime
      result = runtime.false.find_cell(nil, nil, "kind")
      result.data.text.should == 'false'
    end

    it "should not be possible to mimic" do 
      runtime = IokeRuntime.get_runtime
      proc do 
        runtime.evaluate_stream(StringReader.new("false mimic"))
      end.should raise_error
    end
    
    it "should act as false in if statement" do 
      runtime = IokeRuntime.get_runtime
      runtime.evaluate_stream(StringReader.new("if(false, 42, 43)")).
        data.as_java_integer.should == 43
    end
  end
  
  describe "true" do 
    it "should have the correct kind" do 
      runtime = IokeRuntime.get_runtime
      result = runtime.true.find_cell(nil, nil, "kind")
      result.data.text.should == 'true'
    end

    it "should not be possible to mimic" do 
      runtime = IokeRuntime.get_runtime
      proc do 
        runtime.evaluate_stream(StringReader.new("true mimic"))
      end.should raise_error
    end
    
    it "should act as true in if statement" do 
      runtime = IokeRuntime.get_runtime
      runtime.evaluate_stream(StringReader.new("if(true, 42, 43)")).
        data.as_java_integer.should == 42
    end
  end
  
  describe "Base" do 
    it "should have the correct kind" do 
      runtime = IokeRuntime.get_runtime
      result = runtime.base.find_cell(nil, nil, "kind")
      result.data.text.should == 'Base'
    end

    it "should have a 'mimic' cell" do 
      runtime = IokeRuntime.get_runtime
      result = runtime.base.find_cell(nil, nil, "mimic")
      result.should_not == runtime.nul
    end
  end

  describe "Ground" do 
    it "should have the correct kind" do 
      runtime = IokeRuntime.get_runtime
      result = runtime.ground.find_cell(nil, nil, "kind")
      result.data.text.should == 'Ground'
    end

    it "should have all the expected cells" do 
      runtime = IokeRuntime.get_runtime
      runtime.ground.find_cell(nil, nil, 'Base').should == runtime.base
      runtime.ground.find_cell(nil, nil, 'DefaultBehavior').should == runtime.defaultBehavior
      runtime.ground.find_cell(nil, nil, 'Ground').should == runtime.ground
      runtime.ground.find_cell(nil, nil, 'Origin').should == runtime.origin
      runtime.ground.find_cell(nil, nil, 'System').should == runtime.system
      runtime.ground.find_cell(nil, nil, 'Runtime').should == runtime.iokeRuntime
      runtime.ground.find_cell(nil, nil, 'Text').should == runtime.text
      runtime.ground.find_cell(nil, nil, 'Number').should == runtime.number
      runtime.ground.find_cell(nil, nil, 'nil').should == runtime.nil
      runtime.ground.find_cell(nil, nil, 'true').should == runtime.true
      runtime.ground.find_cell(nil, nil, 'false').should == runtime.false
      runtime.ground.find_cell(nil, nil, 'Method').should == runtime.get_method
      runtime.ground.find_cell(nil, nil, 'DefaultMethod').should == runtime.defaultMethod
      runtime.ground.find_cell(nil, nil, 'JavaMethod').should == runtime.javaMethod
      runtime.ground.find_cell(nil, nil, 'Mixins').should == runtime.mixins
    end
  end

  describe "System" do 
    it "should have the correct kind" do 
      runtime = IokeRuntime.get_runtime
      result = runtime.system.find_cell(nil, nil, "kind")
      result.data.text.should == 'System'
    end
  end

  describe "Runtime" do 
    it "should have the correct kind" do 
      runtime = IokeRuntime.get_runtime
      result = runtime.runtime.find_cell(nil, nil, "kind")
      result.data.text.should == 'Runtime'
    end
  end

  describe "DefaultBehavior" do 
    it "should have the correct kind" do 
      runtime = IokeRuntime.get_runtime
      result = runtime.defaultBehavior.find_cell(nil, nil, "kind")
      result.data.text.should == 'DefaultBehavior'
    end
  end

  describe "Origin" do 
    it "should have the correct kind" do 
      runtime = IokeRuntime.get_runtime
      result = runtime.origin.find_cell(nil, nil, "kind")
      result.data.text.should == 'Origin'
    end
  end

  describe "Text" do 
    it "should have the correct kind" do 
      runtime = IokeRuntime.get_runtime
      result = runtime.text.find_cell(nil, nil, "kind")
      result.data.text.should == 'Text'
    end
  end

  describe "Number" do 
    it "should have the correct kind" do 
      runtime = IokeRuntime.get_runtime
      result = runtime.number.find_cell(nil, nil, "kind")
      result.data.text.should == 'Number'
    end
  end

  describe "Method" do 
    it "should have the correct kind" do 
      runtime = IokeRuntime.get_runtime
      result = runtime.getMethod.find_cell(nil, nil, "kind")
      result.data.text.should == 'Method'
    end
  end

  describe "DefaultMethod" do 
    it "should have the correct kind" do 
      runtime = IokeRuntime.get_runtime
      result = runtime.default_method.find_cell(nil, nil, "kind")
      result.data.text.should == 'DefaultMethod'
    end
  end

  describe "JavaMethod" do 
    it "should have the correct kind" do 
      runtime = IokeRuntime.get_runtime
      result = runtime.java_method.find_cell(nil, nil, "kind")
      result.data.text.should == 'JavaMethod'
    end
  end

  describe "Mixins" do 
    it "should have the correct kind" do 
      runtime = IokeRuntime.get_runtime
      result = runtime.mixins.find_cell(nil, nil, "kind")
      result.data.text.should == 'Mixins'
    end

    it "should have Comparing defined" do 
      runtime = IokeRuntime.get_runtime
      runtime.mixins.find_cell(nil, nil, 'Comparing').should_not == runtime.nul
    end
  end

  describe "Message" do 
    it "should have the correct kind" do 
      runtime = IokeRuntime.get_runtime
      result = runtime.message.find_cell(nil, nil, "kind")
      result.data.text.should == 'Message'
    end
  end

  describe "Context" do 
    it "should have the correct kind" do 
      runtime = IokeRuntime.get_runtime
      result = runtime.context.find_cell(nil, nil, "kind")
      result.data.text.should == 'Context'
    end
  end

  describe "Comparing" do 
    it "should have the correct kind" do 
      runtime = IokeRuntime.get_runtime
      result = runtime.ground.find_cell(nil, nil, "Mixins").find_cell(nil, nil, "Comparing").find_cell(nil, nil, "kind")
      result.data.text.should == 'Comparing'
    end
  end
end