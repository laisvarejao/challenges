class MyHash

  def initialize
    @keys = []
    @values = []
  end

  def add_key_value_pair(key, value)
    hash_code = generate_hash_code(key)
    add_to_next_available_position(hash_code, key, value)
  end

  def get_value(key)
    hash_code = generate_hash_code(key)
    get_value_for(hash_code, key)
  end

  private

    def add_to_next_available_position(hash_code, key, value)
      unless occupied_by?(hash_code)
        add_to(hash_code, key, value)
      else
        if occupied_by_correct_key?(hash_code, key)
          add_value(hash_code, value)
        else
          hash_code = increment(hash_code)
          add_to_next_available_position(hash_code, key, value)
        end
      end
    end

    def generate_hash_code(key)
      key.each_byte { |b| b }.sum
    end

    def occupied_by?(hash_code)
      @keys[hash_code]
    end

    def occupied_by_correct_key?(hash_code, key)
      @keys[hash_code] == key
    end

    def add_to(hash_code, key, value)
      add_key(hash_code, key)
      add_value(hash_code, value)
    end

    def add_key(hash_code, key)
      @keys[hash_code] = key
    end

    def add_value(hash_code, value)
      @values[hash_code] = value
    end

    def increment(hash_code)
      hash_code + 1
    end

    def get_value_for(hash_code, key)
      if occupied_by_correct_key?(hash_code, key)
        @values[hash_code]
      else
        hash_code = increment(hash_code)
        get_value_for(hash_code, key)
      end
    end

end