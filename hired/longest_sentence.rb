def solution(s)
  s.split(/\.|\?|\!/).map { |sentence|
    sentence.split(/\s+/).count do |word|
      word.match(/\p{L}/)
    end
  }.max
end

def solution(s)
  s.split(/\.|\?|\!/).map { |sentence|
    sentence.split(/\s+/).count do |word|
      word.match(/\p{L}/)
    end
  }.max
end


puts solution("We trickie you 2! Into thinking. Longest is 4!")
