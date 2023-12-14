# Ruby Metaprogramming Project
This project is part of the "Script Languages" subject and demonstrates the use of metaprogramming in Ruby.

## Overview
This repository contains a Ruby library that implements various functionalities for handling tabular data. The primary file for examples and usage is [`app.rb`](app.rb).

## Project Description
The project requirements and their corresponding implementation points are outlined below:

### Requirements and Implementation Points

1. **Return 2D array with table values**
2. **Access rows via `t.row(1)` and elements using array syntax**
3. **Implement `Enumerable` module with `each` function to iterate through cells**
4. **Handle merged fields within the library**
5. **Enhance syntax for accessing specific values**
    - Retrieve an entire column: `t["First Column"]`
    - Access column values: `t["First Column"][1]` for the second element
    - Set cell value: `t["First Column"][1] = 2556`
6. **Allow direct column access via corresponding methods**
    - `t.firstColumn`, `t.secondColumn`, `t.thirdColumn`
    - Calculate subtotal/average: `t.firstColumn.sum`, `t.firstColumn.avg`
    - Retrieve a row based on a cell value: `t.index.rn2310`
    - Support functions like `map`, `select`, `reduce`
7. **Recognize and ignore rows containing keywords like "total" or "subtotal"**
8. **Enable addition of two tables with identical headers (SQL UNION operation)**
    - `t1 + t2` combines rows from both tables
9. **Allow subtraction of two tables with identical headers**
    - `t1 - t2` removes rows from t2 that match t1

### Not done
- Implementation of functionality for point 7.