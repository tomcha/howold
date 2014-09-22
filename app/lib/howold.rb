#!/usr/bin/env ruby

def date_validate(date_strings)
  if(date_strings =~ /^(s|h)(\d+)(\.|\/|\-)(\d+)(\.|\/|\-)(\d+)$/i)
    if($1 == 's' || $1 == 'S')
      p $2
      y = $2.to_i + 1925
      m = $4.to_i
      d = $6.to_i
      return y, m, d
    else
      y = $2.to_i + 1988
      m = $4.to_i
      d = $6.to_i
      return y, m, d
    end
  elsif(date_strings =~ /^(\d+)(\.|\/|\-)(\d+)(\.|\/|\-)(\d+)$/)
    y = $1.to_i
    m = $3.to_i
    d = $5.to_i
    return y, m, d
  else
    return false
  end
end

def age_calculate(birth_date, base_date)
  age = 0
  age += base_date[0] - birth_date[0]
  if(base_date[1] < birth_date[1])
    age -= 1
  elsif((base_date[1] == birth_date[1]) && (base_date[2] < birth_date[2]))
    age -= 1
  end
  return age
end
__END__
