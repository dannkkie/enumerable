# frozen_string_literal: true

# spec/enumerable_spec.rb

require './enumerable.rb'

describe Enumerable do
  let(:arr) { [2, 4, 7, 2] }
  let(:ans) { [] }

  describe 'my_each' do
    it 'should steps through array and do block' do
      arr.my_each { |i| ans << i * 2 }
      expect(ans).to eq([4, 8, 14, 4])
    end
  end

  describe 'my_each_with_index' do
    it 'should step through array and return index' do
      arr.my_each_with_index { |_i, j| ans << j }
      expect(ans).to eq([0, 1, 2, 3])
    end
  end

  describe 'my_select' do
    it 'returns array containing all elements for which given block returns true' do
      expect(arr.my_select(&:even?)).to eq([2, 4, 2])
    end
    it 'returns a blank array if all false' do
      expect(arr.my_select { |i| i > 10 }).to eq([])
    end
  end

  describe 'my_all?' do
    it 'returns true if no elements return false' do
      expect(arr.my_all? { |i| i < 10 }).to eq(true)
    end
    it 'returns false if one or more elements return false' do
      expect(arr.my_all? { |i| i < 6 }).to eq(false)
    end
  end

  describe 'my_any?' do
    it 'returns true if one condition is true' do
      expect(arr.my_any? { |i| i > 6 }).to eq(true)
    end
    it 'returns false if all conditions are false' do
      expect(arr.my_any? { |i| (i % 10).zero? }).to eq(false)
    end
  end

  describe 'my_none?' do
    it 'returns true if all conditions are false' do
      expect(arr.my_none? { |i| (i % 10).zero? }).to eq(true)
    end
    it 'returns false if one condition is true' do
      expect(arr.my_none? { |i| i > 6 }).to eq(false)
    end
  end

  describe 'my_count' do
    it 'returns the number of items in an array if no argument is passed' do
      expect(arr.my_count).to eq(4)
    end
    it 'returns the number of items equal to passed argument' do
      expect(arr.my_count(2)).to eq(2)
      expect(arr.my_count(4)).to eq(1)
    end
    it 'counts number of true elements if block is given' do
      expect(arr.my_count { |i| i < 6 }).to eq(3)
    end
  end

  describe 'my_map' do
    it 'returns new array with the results from running block once' do
      expect(arr.my_map { |i| i**2 }).to eq([4, 16, 49, 4])
    end
    it 'returns enumerator if no block is given' do
      expect(arr.map { 'cat' }).to eq(%w[cat cat cat cat])
    end
  end

  describe 'my_inject' do
    it 'uses a block and returns memo' do
      expect(arr.my_inject { |sum, i| sum + i }).to eq(15)
    end
    it 'multiplies elements from array' do
      expect(arr.my_inject(1) { |memo, n| memo * n }).to eq(112)
    end
  end
end
