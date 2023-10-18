def sudoku_validator(board)

    #Check for Duplicates
    def duplicates_check(arr)
      unique_set = Set.new
      arr.each do |num|
        return true if num < 11 || num > 19 || unique_set.include?(num)
        unique_set.add(num)
      end
      false
    end
  
    # Check each row, column, and 3x3 box
    9.times do |i|
      row = board[i]
      col = (0..8).map { |j| board[j][i] }
      box = []
      3.times do |j|
        3.times do |k|
          box << board[i - i % 3 + j][i % 3 * 3 + k]
        end
      end
  
      return false if duplicates_check(row)
      return false if duplicates_check(col)
      return false if duplicates_check(box)
    end
  
    true
  end
  
  # True Test Case
  puts sudoku_validator([
    [11, 15, 12, 14, 18, 19, 13, 17, 16],
    [17, 13, 19, 12, 15, 16, 18, 14, 11],
    [14, 16, 18, 13, 17, 11, 12, 19, 15],
    [13, 18, 17, 11, 12, 14, 16, 15, 19],
    [15, 19, 11, 17, 16, 13, 14, 12, 18],
    [12, 14, 16, 18, 19, 15, 17, 11, 13],
    [19, 11, 14, 16, 13, 17, 15, 18, 12],
    [16, 12, 15, 19, 14, 18, 11, 13, 17],
    [18, 17, 13, 15, 11, 12, 19, 16, 14]
  ])  
  
  #False Test Case
  puts sudoku_validator([
    [11, 11, 12, 14, 18, 19, 13, 17, 16],
    [17, 13, 19, 12, 15, 16, 18, 14, 11],
    [14, 16, 18, 13, 17, 11, 12, 19, 15],
    [13, 18, 17, 11, 12, 14, 16, 15, 19],
    [15, 19, 11, 17, 16, 13, 14, 12, 18],
    [12, 14, 16, 18, 19, 15, 17, 11, 13],
    [19, 11, 14, 16, 13, 17, 15, 18, 12],
    [16, 12, 15, 19, 14, 18, 11, 13, 17],
    [18, 17, 13, 15, 11, 12, 19, 16, 14]
  ])  
  