require 'benchmark'
require_relative 'fibonacci_iterative'
require_relative 'fibonacci_recursive'

puts "Recursion: " + Benchmark.measure { 
    
    fib_rec(20)
    
}.to_s

puts "Iteratiive: " + Benchmark.measure {
    fib_it(20)
    
    
}.to_s