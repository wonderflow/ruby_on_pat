#!/usr/bin/ruby

require 'benchmark'
patid = ARGV[0]
show = ARGV[1]

if ARGV.size !=1 and ARGV.size !=2
  puts "Usage: ./judge.rb [pat_problem_id] [show diff result]"
end

Benchmark.bm do |x|
  x.report{ `./#{patid}.rb <in.in >tmp.out`}
  result = `diff tmp.out out.out`
  if result == ""
    puts "Yes"
  else
    puts "No"
  end
  puts result if show
end

`rm tmp.out`
