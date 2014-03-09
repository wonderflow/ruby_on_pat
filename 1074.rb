#!/usr/bin/ruby

str,n,k = gets.split
array = []
k = k.to_i
n = n.to_i
Edge = Struct.new(:pre,:data,:nex)
Node = Struct.new(:left,:right)
raw_array = []
n.times do |i|
  pre,data,nex = gets.split
  raw_array << Edge.new(pre,data,nex)
  #puts pre.to_i.to_s+" "+nex.to_i.to_s+" "+i.to_s
  if array[pre.to_i]
    array[pre.to_i].right = i
    #p pre+" "+i.to_s
  else
    array[pre.to_i] = Node.new
    array[pre.to_i].right = i
    #p pre+" "+i.to_s
  end
  if nex=="-1" 
    next
  end
  if array[nex.to_i]
    array[nex.to_i].left = i
    #p nex+" "+i.to_s
  else
    array[nex.to_i] = Node.new
    array[nex.to_i].left = i
    #p nex+" "+i.to_s
  end
end


start = str.to_i

#p "sufix"
(k-1).times do 
  start = raw_array[array[start].right].nex.to_i
  #p start
end

clone_start = start



(k-1).times do
  tmp = raw_array[array[start].right]
  #if array[start].left == nil
  #  x1 = raw_array[array[clone_start].right].pre
  #else
  x1 = raw_array[array[start].left].pre
  #end
  puts tmp.pre+" "+tmp.data+" "+x1
  start = raw_array[array[start].left].pre.to_i
end


tmp = raw_array[array[start].right]
if k!=n
  puts tmp.pre+" "+tmp.data+" "+raw_array[array[clone_start].right].pre
else
  puts tmp.pre+" "+tmp.data+" "+"-1"
end


start = raw_array[array[clone_start].right].nex.to_i

#p "xxxx"

while start!=-1
  #p start
  tmp = raw_array[array[start].right]
  x1 = tmp.nex
  puts tmp.pre+" "+tmp.data+" "+x1
  start = raw_array[array[start].right].nex.to_i
  #p start
end

