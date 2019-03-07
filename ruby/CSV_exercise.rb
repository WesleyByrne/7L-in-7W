module ActsAsCsv
    class CsvRow
        def initialize(csv, csv_contents)
            @csv = csv
            @csv_contents = csv_contents
        end
        def method_missing (name, *args)
            name = @csv_contents[@csv.headers.find_index(name.to_s)] #if @csv.headers.index.next.to_s == name.to_s
        end
    end

    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def acts_as_csv
        include InstanceMethods
      end
    end
    
    module InstanceMethods
      def each(&block)
        csv_contents.each do |contents|
            block.call(CsvRow.new(self, contents))
        end
      end

      def read
        @csv_contents = []
        filename = self.class.to_s.downcase + '.txt'
        file = File.new(filename)
        @headers = file.gets.chomp.split(', ')
  
        file.each do |row|
          @csv_contents << row.chomp.split(', ')
        end
      end
      
      attr_accessor :headers, :csv_contents
      def initialize
        read 
      end
    end
  end
  
  class RubyCsv  # no inheritance! You can mix it in
    include ActsAsCsv
    acts_as_csv
  end
  
  csv = RubyCsv.new
  csv.each {|row| puts row.one}
  