require 'irb'

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  class CsvRow
    def initialize(headers, row)
      @headers = headers
      @row = row
    end

    def method_missing(name)
      col_index = @headers.index(name.to_s)
      return @row[col_index] if col_index
    end
  end
  
  module InstanceMethods   
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.csv'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << CsvRow.new(@headers, row.chomp.split(', '))
      end
    end

    def each(&block)
      @csv_contents.each { |row| block.call(row) }
    end
    
    attr_accessor :headers, :csv_contents
    def initialize
      read 
    end
  end
end

class Example  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

csv = Example.new
csv.each { |row| puts row.one }
