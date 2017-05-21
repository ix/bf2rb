data = []
dp = 0
while data[dp].to_i != 0 do
end
puts data[dp].to_i.chr
data[dp] = data[dp].to_i + 1
while data[dp].to_i != 0 do
puts data[dp].to_i.chr
data[dp] = data[dp].to_i + 1
end
