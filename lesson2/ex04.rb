alphabet = ("a".."z")
vowels = ["a", "e", "i", "o", "u", "y"]
vowels_hash = {}

alphabet.each.with_index(1) do |letter, index|
  vowels_hash[letter] = index if vowels.include?(letter)
end
