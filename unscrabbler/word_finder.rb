require "json"

class WordFinder
  def find(letters)
    words_array = [];
    @number_of_letters = {};
    @words_length = letters.length;

    dictionary_words = File.read("dictionary.json");
    text = JSON.parse(dictionary_words);

    lettersArray = letters.split("");

    for letter in lettersArray
      if(@number_of_letters.include?(letter));
        @number_of_letters[letter] = @number_of_letters[letter] + 1;
      else
        @number_of_letters[letter] = 1;
      end
    end

    for word in text
      if(is_valid(word) === true);
        words_array.push(word);
      end
    end
    words_array;
  end

  def is_valid(word)
    if(word.length > @words_length);
      return false;
    end
    total_words = 0;
    for letter, number in @number_of_letters
      if(word.count(letter) > number);
        return false;
      end
      total_words = word.count(letter) + total_words;
    end
    total_words == word.length;
  end
end
