require 'roo'

class Column

    def initialize(table, column, colindex)
        @column = column                         # niz vrednosti u koloni
        @table = table
        @colindex = colindex
    end

    def +(other_column)
        return nil if @column.nil? || other_column.nil?
    
        result = @column.zip(other_column).map do |a, b|
            a = a.to_f if a.is_a?(Numeric) rescue 0
            b = b.to_f if b.is_a?(Numeric) rescue 0
            a + b
        end
    
        Column.new(@table, result, @colindex)
    end

    # def [](index)
    #     row_index = index + 1 # Adjust for 1-based index
    #     @table.row(row_index)[@column_index - 1] # Access the cell value
    #   end
    
    #   def []=(index, value)
    #     row_index = index + 1 # Adjust for 1-based index
    #     @table[row_index][@column_index] = value # Update the cell value
    # end

    def sum
        # sabiramo elemente niza - startna suma = 0
        @column.inject(0){ |sum, x| sum + x.to_f }
    end

    def avg
        numeric_count = @column.count { |value| value.is_a?(Numeric) }
        sum / numeric_count
    end

    def to_s
        @column
    end

    # On the original table
    def map!(&block)
        @column.each_with_index do |value, index|
            if value.is_a?(Numeric)
                updated_value = block.call(value)
                @table.set(index + 2, @colindex, updated_value)
            end
        end
    end

    # On the original table
    def reduce(initial, &block)
        accumulator = initial
        @column.each do |value|
            accumulator = block.call(accumulator, value) if value && value.is_a?(Numeric)
        end
        accumulator
    end

    def select!(&block)
        selected_values = []
        @column.each do |value|
            selected_values << value if value && value.is_a?(Numeric) && value &&block.call(value) 
        end
        selected_values
    end

    # m - ime nepostojece metode
    def method_missing(m)
        @column.each_with_index do |col, i|
            if col.to_s.downcase.gsub(' ', '_').eql?(m.to_s.downcase.gsub(' ', '_'))
                # dodajemo 2 jer i = 0 + preskacemo header
                return @table.row(i+2)
            end
        end
    end

end