class Caesar
  # Encode a string with a given rotation. Only letters are shifted, other characters are preserved. 
  def encode(str, rot)
    codes = get_charcodes(str)
    get_string(codes
      .map {|code| {code: code, offset: get_offset(code)}}
      .each {|pair| pair[:code] = apply_offset(pair[:code], pair[:offset])}
      .each {|pair| pair[:code] = apply_rot(pair[:code], rot) if pair[:offset] != 0}
      .each {|pair| pair[:code] = remove_offset(pair[:code], pair[:offset])}
      .map {|pair| pair[:code]})
  end

  # Get array of char codes from a string
  def get_charcodes(str)
    str.split("").map {|char| char.ord}
  end

  # Get the offset required to bring a letter's char code into the range 0-26
  def get_offset(charcode)
    if charcode >= 97 && charcode <= 122
      return 97
    elsif charcode >= 65 && charcode <= 90
      return 65
    else
      return 0
    end
  end

  # Apply an offset to a charcode
  def apply_offset(charcode, offset)
    charcode - offset
  end

  # Apply a rotation to a char code (that should already have been offset into the range 0-26)
  def apply_rot(charcode, rot)
    (charcode + rot) % 26
  end

  # De-offset a char code
  def remove_offset(charcode, offset)
    charcode + offset
  end

  # Get a string from an array of char codes
  def get_string(charcodes)
    charcodes.map {|code| code.chr}.join("")
  end
end
