# Valgrind_modified
Valgrind is a programming tool for memory debugging, memory leak detection, and profiling.



Requirements:

  1.lex
  
  2.valgrind
  
  
How To Use:
  1. run make
  2. run valgrind --leak-check=yes executable arg1 arg2
  
  
  
 There are multiple tools included with Valgrind (and several external ones). The default (and most used) tool is Memcheck. Memcheck inserts extra instrumentation code around almost all instructions, which keeps track of the validity (all unallocated memory starts as invalid or "undefined", until it is initialized into a deterministic state, possibly from other memory) and addressability (whether the memory address in question points to an allocated, non-freed memory block), stored in the so-called V bits and A bits respectively. As data is moved around or manipulated, the instrumentation code keeps track of the A and V bits, so they are always correct on a single-bit level. 
	Limitations of Memcheck
	an important limitation of Memcheck is its inability to detect all cases of bounds errors in the use of static or stack-allocated data.
 We were able to change the program which is going to be testing in a way that will help Memcheck to detect the bound error. For that we used the fast lexical analyzer generator(Flex version 2.6.4)
	https://en.wikipedia.org/wiki/Flex_(lexical_analyser_generator).
The external code we wrote will add some lines to the program on which we want to run the Memcheck.

