require 'roo'

class Column

    def initialize(table, column, colindex)
        @column = column                         # niz vrednosti u koloni
        @table = table
        @colindex = colindex
    end

    def [](index)
        row_index = index + 1
        return nil unless (1..@table.last_row).cover?(row_index)    # proveravamo da li je index u opsegu
      
        @table.cell(row_index, @colindex)    # vracamo vrednost celije - method from roo gem
    end
      
    def []=(index, value)
        row_index = index + 1
        return nil unless (1..@table.last_row).cover?(row_index)    # proveravamo da li je index u opsegu

        @table.set(row_index, @colindex, value)   # podesavamo vrednost celije - method from roo gem
    end

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
        rows_with_value = []
        @column.each_with_index do |col, i|
                # dodajemo 2 jer i = 0 + preskacemo header
                rows_with_value << @table.row(i+2) if col.to_s.downcase.gsub(' ', '_').eql?(m.to_s.downcase.gsub(' ', '_'))
        end
        rows_with_value
    end

end