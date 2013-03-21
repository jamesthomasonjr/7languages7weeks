class CsvRow
	def initialize(array)
		@content = array
	end

	# "Use method_missing on that CsvRow to return the value
	# for the column for a given heading"
	def method_missing name, *args
		to_int = {
			:one => 0,
			:two => 1,
			:three => 2,
			:four => 3,
			:five => 4,
			:six => 5,
			:seven => 6,
			:eight => 7,
			:nine => 8,
			:ten => 9}
		return @content[to_int[name]] if to_int.has_key?(name)
		nil
	end
end

module ActsAsCsv

	# Is called automatically when module is included in a class
	def self.included(base)
		# Extend adds the given module as class methods,
		# while include adds the module as instance methods.
		# This isn't covered too well in the book.
		base.extend ClassMethods
	end

	# Module to be loaded as class methods.
	# Is called via self.include
	module ClassMethods
		# "Macro" method to include instance methods
		def acts_as_csv
			include InstanceMethods
		end
	end

	# Module to be loaded as instance methods.
	# Is called via "Macro" method acts_as_csv
	module InstanceMethods

		def read
			@csv_contents = []
			filename = self.class.to_s.downcase + '.txt'
			file = File.new(filename)
			@headers = file.gets.chomp.split(', ')

			file.each do |row|
				@csv_contents << row.chomp.split(', ')
			end
		end

		# "an each method to return a CsvRow object"
		def each
			filename = self.class.to_s.downcase + '.txt'
			file = File.new(filename)
			@headers = file.gets.chomp.split(', ')

			file.each { |row| yield CsvRow.new(row.chomp.split(', ')) }
		end

		attr_accessor :headers, :csv_contents

		def initialize
			read
		end

	end
end

class RubyCsv # no inheritance: mixed in via modules instead
	#including ActsAsCsv automatically extends ActsAsCsv::ClassMethods
	include ActsAsCsv
	#Call the "Macro" method from ClassMethods to include ActsAsCsv::InstanceMethodss
	acts_as_csv
end

csv = RubyCsv.new
csv.each {|row| puts row.one}