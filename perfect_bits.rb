def perfect_bits(a, b)
  seen = Hash.new(0)
  count = 0
  i = a
  while i <= b
    binary = binaryify(i)
    perfect, seen = perfect_bit?(binary, seen)
    count += 1 if perfect
    i += 1
  end

  count
end

def binaryify(a)
  output = []
  until a < 2
    output.unshift(a % 2)
    a = a/2
  end

  output.unshift(a).join("")
end

def perfect_bit?(a, seen = Hash.new(0))
  return [false, seen] if a == "0"

  ones = 0
  a.chars.each { |n| ones += 1 if n == "1" }

  if seen[ones] == -1 || seen[ones] == 1
    return seen[ones] == -1 ? [false, seen] : [true, seen]
  else
    i = seen.length > 0 ? seen.keys.max : 1
    until i ** 2 > ones
      if i ** 2 == ones
        seen[ones] = 1
        return [true, seen]
      end
      i += 1
    end
  end

  seen[ones] = -1
  [false, seen]
end
