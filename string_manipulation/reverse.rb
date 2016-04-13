def reverse(string)
  ew = string.length

  string.lenghth.downto(0).inject([], do |result, idx|
    if string[idx] == " "
      result << string[(idx + 1)..ew]
      ew = idx - 1
    end
    result
  end

  result << string[0..ew]
  if str
  result.join(" ")
end
