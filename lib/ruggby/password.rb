require 'digest/sha1'


module RuGGby

  # Password encryption method
  class Password

    # SHA1
    HASH_TYPE = 0x02

    # Hash password with seed to a format accepted by GG server
    def self.hash(password, seed)
      Digest::SHA1.digest(password+[seed].pack('L'))
    end

  end

end