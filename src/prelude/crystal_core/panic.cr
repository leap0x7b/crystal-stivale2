def abort(message : String)
  raise message
end

def panic(message : String)
  raise message
end

def raise(message : String)
  #Console.print "\n\n-- fatal exception: ", message, " --\n"
  #Console.print "-- halting --\n"
  #Architecture.halt_processor
end

@[Raises]
fun __crystal_raise(unwind_ex : Void*)
  #Console.print "\n\n-- fatal exception: raise called --\n"
  #Console.print "-- halting --\n"
  #Architecture.halt_processor
  asm("hlt")
end

fun __crystal_raise_overflow
  #Console.print "\n\n-- fatal exception: overflow occured --\n"
  #Console.print "-- halting --\n"
  #Architecture.halt_processor
end

fun __crystal_get_exception(unwind_ex : Void*) : UInt64
  0u64
end
