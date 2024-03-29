require 'rspec'
require_relative '../lib/naming_test'
require_relative '../lib/space_test'

describe NamingTest do
  include NamingTest

  describe '#test_if_variable_name' do
    it 'returns false if given a string that contains def' do
      expect(test_if_variable_name('def example_method')).to be false
    end

    it 'returns false if given a string that contains end' do
      expect(test_if_variable_name('end')).to be false
    end

    it 'returns false if given a string that contains the word "module"' do
      expect(test_if_variable_name('module ExampleModule')).to be false
    end

    it 'returns false if given a string that contains class' do
      expect(test_if_variable_name('class ExampleClass')).to be false
    end

    it 'returns true if given a sring with 1 equals sign' do
      expect(test_if_variable_name('gfdgjkdf = gfdjklgdf')).to be true
    end

    it 'returns false if given a sring with a double equals sign' do
      expect(test_if_variable_name('gfdgjkdf == gfdjklgdf')).to be false
    end
  end

  describe '#test_if_variable_snake_case' do
    it 'returns false if given a string that contains a capital' do
      expect(test_if_variable_snake_case('baDvaRiable = 5')).to be false
    end

    it 'returns true if given a string that has proper snake case' do
      expect(test_if_variable_snake_case('good_snake_case = 6')).to be true
    end

    it 'returns true if given a string that contains proper snake case before the equals and not after' do
      expect(test_if_variable_snake_case('good_snake_case = notVaRiAble')).to be true
    end
  end

  describe '#test_if_method_name' do
    it 'returns true if given a string that starts def' do
      expect(test_if_method_name('def example_method')).to be true
    end

    it 'returns false if given a string that doesnt start with def but has def in it' do
      expect(test_if_method_name('example_method def')).to be false
    end

    it 'returns false if given a string that contains end' do
      expect(test_if_method_name('end')).to be false
    end

    it 'returns false if given a string that contains the word "module"' do
      expect(test_if_method_name('module ExampleModule')).to be false
    end

    it 'returns false if given a string that contains class' do
      expect(test_if_method_name('class ExampleClass')).to be false
    end

    it 'returns false if given a sring with 1 equals sign' do
      expect(test_if_method_name('gfdgjkdf = gfdjklgdf')).to be false
    end

    it 'returns false if given a sring with a double equals sign' do
      expect(test_if_method_name('gfdgjkdf == gfdjklgdf')).to be false
    end
  end
  describe '#test_if_method_snake_case' do
    it 'returns false if given a string that contains a capital after def' do
      expect(test_if_method_snake_case('def baDvaRiable')).to be false
    end

    it 'returns true if given a string that has proper snake case after def' do
      expect(test_if_method_snake_case('def good_snake_case')).to be true
    end
  end
  describe '#test_if_class_name' do
    it 'returns true if given a string that starts class' do
      expect(test_if_class_name('class example_method')).to be true
    end

    it 'returns false if given a string that doesnt start with def but has def in it' do
      expect(test_if_class_name('example_method def')).to be false
    end

    it 'returns false if given a string that contains end' do
      expect(test_if_class_name('end')).to be false
    end

    it 'returns false if given a string that contains the word "module"' do
      expect(test_if_class_name('module ExampleModule')).to be false
    end

    it 'returns false if given a string that contains def' do
      expect(test_if_class_name('def ExampleClass')).to be false
    end

    it 'returns false if given a sring with 1 equals sign' do
      expect(test_if_class_name('gfdgjkdf = gfdjklgdf')).to be false
    end

    it 'returns false if given a sring with a double equals sign' do
      expect(test_if_class_name('gfdgjkdf == gfdjklgdf')).to be false
    end
  end
  describe '#test_if_class_pascal_case' do
    it 'returns false if given a string that does not have a capital at the start of the class definition' do
      expect(test_if_class_pascal_case('class badPascal')).to be false
    end

    it 'returns true if given a string that has proper snake case after class' do
      expect(test_if_class_pascal_case('class GoodPascal')).to be true
    end

    it 'returns false if given a string that contains a _ in the class definition' do
      expect(test_if_class_pascal_case('class Bad_Pascal')).to be false
    end
  end
  describe '#test_if_module_name' do
    it 'returns true if given a string that starts with method' do
      expect(test_if_module_name('module ExampleModule')).to be true
    end

    it 'returns false if given a string with module not at the start' do
      expect(test_if_module_name('def module_example')).to be false
    end

    it 'returns false if given a string that contains end' do
      expect(test_if_module_name('end')).to be false
    end

    it 'returns false if given a string that contains the word "class"' do
      expect(test_if_module_name('class ExampleModule')).to be false
    end

    it 'returns false if given a string that contains def' do
      expect(test_if_module_name('def ExampleClass')).to be false
    end

    it 'returns false if given a sring with 1 equals sign' do
      expect(test_if_module_name('gfdgjkdf = gfdjklgdf')).to be false
    end

    it 'returns false if given a sring with a double equals sign' do
      expect(test_if_module_name('gfdgjkdf == gfdjklgdf')).to be false
    end
  end
  describe '#test_if_module_pascal_case' do
    it 'returns false if given a string that does not have a capital at the start of the module definition' do
      expect(test_if_module_pascal_case('module badPascal')).to be false
    end

    it 'returns true if given a string that has proper snake case after module' do
      expect(test_if_module_pascal_case('module GoodPascal')).to be true
    end

    it 'returns false if given a string that contains a _ in the module definition' do
      expect(test_if_module_pascal_case('module Bad_Pascal')).to be false
    end
  end
end

describe SpaceTest do
  include SpaceTest

  describe '#test_if_trailing_space' do
    it 'returns true if given a string with a space on the end' do
      expect(test_if_trailing_space("test \n")).to be true
    end

    it 'returns false if given a string without a space on the end' do
      expect(test_if_trailing_space("test\n")).to be false
    end
  end

  describe '#test_if_empty_line(input)' do
    it 'returns true if given an empty line' do
      expect(test_if_empty_line('')).to be true
    end

    it 'returns false if given anything besides an empty line' do
      expect(test_if_empty_line('gfdg\n')).to be false
    end
  end
end
