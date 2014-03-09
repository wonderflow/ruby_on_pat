#!/usr/bin/ruby

class BigDate
  def initialize(str)
    @str = str
  end

  def work()
    flagp = positive?
    sp = @str.split(".")
    strl = sp[0]
    @str = sp[1]
    dotdex = strl.length
    sp = @str.split("E")
    strl << sp[0]
    @str = sp[1]
    flage = positive?
    enum = @str.to_i
    if flage 
      dotdex += enum
    else
      dotdex -= enum
    end
   # p dotdex
    if flagp==false
      print "-"
    end
    if dotdex <= 0
      print "0."
      m = (0-dotdex)
      if m>0
        m.times do 
          print "0"
        end
      end
      print strl
    elsif dotdex>=strl.length
      print strl
      m = dotdex-strl.length
      if m > 0
        m.times do 
          print "0"
        end
      end
    else
      index = 0
      #p strl
      strl.each_char do |c|
        if index == dotdex
          print "."
        end
        print c
        index+=1
      end
    end
    print "\n"
  end

  def positive?()
    c = @str[0]
    if c!="+" and c!="-"
      return true
    end
    @str = @str[1..-1]
    c == "+"
  end

  def strl_num()
    str = ""
    while @str[0]=~/[0-9]/
      str << @str[0]
      @str = @str[1..-1]
    end
    @str = @str[2..-1] # remove "."
    str.to_i
  end

end



#file = File.open("1073.in")
while str = gets
  bd = BigDate.new(str.chomp)
  bd.work
end
#file.close

