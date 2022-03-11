require "./stivale2"

stack = uninitialized UInt8[8192]

@[Used]
terminal_header = HeaderTags::Terminal.new 
terminal_header.tag.identifier = HeaderTags::Identifier::Terminal.value
terminal_header.tag.next = nil
terminal_header.flags = 0

@[Used]
framebuffer_header = HeaderTags::Framebuffer.new 
framebuffer_header.tag.identifier = HeaderTags::Identifier::Framebuffer.value
framebuffer_header.tag.next = pointerof(terminal_header).as(Stivale2::Tag*)
framebuffer_header.width = 0
framebuffer_header.height = 0
framebuffer_header.bpp = 0

asm(".section .stivale2hdr")
@[Used]
stivale_header = Stivale2::Header.new
stivale_header.entry_point = 0
stivale_header.stack = pointerof(stack).address + (8192 * sizeof(UInt8))
stivale_header.flags = (1 << 1) | (1 << 2) | (1 << 3) | (1 << 4)
stivale_header.tags = pointerof(framebuffer_header).as(Stivale2::Tag*)
asm(".section .text")

def get_tag(stivale : Stivale2::Struct, id : UInt64) : UInt64?
  current_tag = stivale.tags

  while !current_tag.nil?
    tag = current_tag.value
    if tag.identifier == id
      return pointerof(tag).address
    end
    current_tag = tag.next
  end
end

fun _start(stivale : Stivale2::Struct)
  terminal_tag = get_tag(stivale, Tags::Identifier::Terminal.value).unsafe_as(Tags::Terminal)
  terminal_tag.term_write.call "hello".as(UInt8*), 5
end

fun __crystal_once_init : Void*
  Pointer(Void).new 0
end

fun __crystal_once(state : Void*, flag : Bool*, initializer : Void*)
  unless flag.value
    flag.value = true
  end
end

fun __crystal_personality
end
