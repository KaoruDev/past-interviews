require 'set'

ELMS = Set.new(%w{ e h he eh Be Ga N })
@count = 0

def is_correct(str, map={})
  @count += 1
  return true if str[0].nil?
  return false if map[str] == false

  if ELMS.include? str[0]
    return true if map[str[1..-1]] = is_correct(str[1..-1], map)
  end

  if ELMS.include? str[0..1]
    return map[str[2..-1]] = is_correct(str[2..-1], map)
  end

  false
end

puts "expect #{is_correct("hehehehehehehehehehehehex")} is false"
#puts "expect #{is_correct("BeGaN")} is true"
#puts "expect #{is_correct("BeGaN")} is true"
puts "iterations #{@count}"

                  #hehehex
          #ehehex           hehex
          #hehex            hex
          #ehex             xh
