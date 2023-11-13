require 'roo'
require 'roo-xls'
require './column'

class Table include Enumerable
  
    def initialize(path)
        @table = Roo::Spreadsheet.open(path, { :expand_merged_ranges => true })
        @columns = Hash.new                                                        # mapa: headere kolone -> indeks kolone

        # uzme prvi red i za svaki element u redu dodaje u hash   
        # lowercase + space -> underscore   
        # index + 1 (1-based index)                                   
        @table.row(1).each_with_index do |header, i|
            @columns[header.downcase.gsub(' ', '_')] = i + 1
        end
    end
  
    def +(table2)
        # mozemo da sabiramo samo ako su isti headeri (deeply equal arrays)
        # parse -> vraca vrednosti u nizu nizova (svaki niz je jedan red)
        if(@table.row(1).eql?(table2.table.row(1)))
            return  @table.parse + table2.table.parse
        end
        return nil
    end
  
    def -(table2)
        # ista logika kao za sabiranje
        if(@table.row(1).eql?(table2.table.row(1)))
            return @table.parse - table2.table.parse
        end
        return nil
    end
  
    # generisemo novi Column ako ne postoji
    # header - ime nepostojece metode
    def method_missing(header)
        column_index = @columns[header.to_s.downcase.gsub(' ', '_')]
        return super unless column_index

        column_data = @table.column(column_index).drop(1)
        Column.new(@table, column_data, column_index)
    end

    def row(index)
        @table.row(index)
    end
  
    def [](key)
        # matchujemo key sa headerima (lowercase + space -> underscore)
        # vracamo kolonu bez headera
        column_index = @columns[key.to_s.downcase.gsub(' ', '_')]
        column_index ? @table.column(column_index).drop(1) : nil
        # column_data = @table.column(column_index).drop(1)
        # Column.new(@table, column_data, column_index)
    end

    def each
        yield @table.parse
    end
  
    def table
        @table
    end
  
    def to_s
        @table.parse
    end

  end