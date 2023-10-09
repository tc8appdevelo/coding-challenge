require 'time'

str = "photo.jpg, Krakow, 2013-09-05 14:08:15
Mike.png, London, 2015-06-20 15:13:22
myFriends.png, Krakow, 2013-09-05 14:07:13
Eiffel.jpg, Florianopolis,2015-07-23 08:03:02
pisatower.jpg, Florianopolis, 2015-07-22 23:59:59
BOB.jpg, London, 2015-08-05 00:02:03
notredame.png, Florianopolis, 2015-09-01 12:00:00
me.jpg, Krakow, 2013-09-06 15:40:22
a.png, Krakow, 2016-02-13 13:33:50
b.jpg, Krakow, 2016-01-02 15:12:22
c.jpg, Krakow, 2016-01-02 14:34:30
d.jpg, Krakow, 2016-01-02 15:15:01
e.png, Krakow, 2016-01-02 09:49:09
f.png, Krakow, 2016-01-02 10:55:32
g.jpg, Krakow, 2016-02-29 22:13:11"

Photo = Struct.new(:extension, :location, :date, :ans_idx)

def solution(s)
  hash = Hash.new { |h, k| h[k] = [] }
  answer = s.split("\n")
  s.split("\n").each_with_index do |ele, idx|
    attributes = ele.split(",")
    extension = attributes[0].split(".")[1]
    date = Time.parse(attributes[2])
    location = attributes[1].strip

    photo = Photo.new(extension, location, date, idx)
    
    hash[location] << photo
  end

  hash.each do |key, val|
    num_length = val.length.to_s.length
    val.sort! { |a, b| a.date <=> b.date }

    val.each_with_index do |photo, idx|
      zeros = num_length - (idx + 1).to_s.length
      answer[photo.ans_idx] = photo.location + "0" * zeros + (idx + 1).to_s + "." + photo.extension
    end
  end
  answer.join("\n")
end

puts solution(str)
