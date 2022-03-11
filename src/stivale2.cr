lib Stivale2
  struct Anchor
    anchor : UInt8[15]
    bits : UInt8
    phys_load_addr : UInt64
    phys_bss_start : UInt64
    phys_bss_end : UInt64
    phys_stivale2hdr : UInt64
  end

  @[Packed]
  struct Header
    entry_point : UInt64
    stack : UInt64
    flags : UInt64
    tags : Tag*
  end

  struct Struct
    bootloader_brand : UInt8[64]
    bootloader_version : UInt8[64]
    tags : Tag*
  end

  struct Tag
    identifier : UInt64
    next : Tag*
  end
end

lib HeaderTags
  enum Identifier : UInt64
    AnyVideo        = 0xc75c9fa92a44c4db
    Framebuffer     = 0x3ecc1bc43d0f7971
    FramebufferMtrr = 0x4c7bb07731282e00
    Terminal        = 0xa85d499b1823be72
    FiveLevelPaging = 0x932f477032007e8f
    SlideHddm       = 0xdc29269c2af53d1d
    UnmapNull       = 0x92919432b16fe7e7
    Smp             = 0x1ab015085f3273df
  end

  struct AnyVideo
    tag : Stivale2::Tag
    preference : UInt64
  end

  struct Framebuffer
    tag : Stivale2::Tag
    width : UInt16
    height : UInt16
    bpp : UInt16
    unused : UInt16
  end

  struct FramebufferMttr
    tag : Stivale2::Tag
  end

  struct Terminal
    tag : Stivale2::Tag
    flags : UInt64
    callback : Proc(UInt64, UInt64, UInt64, UInt64)
  end

  enum CallbackTypes
    DecPrivateMode  = 10
    Bell            = 20
    PrivateId       = 30
    StatusReport    = 40
    PosititonReport = 50
    KeyboardLed     = 60
    ModeSwitch      = 70
    LinuxEscapeSeq  = 80
  end

  struct FiveLevelPaging
    tag : Stivale2::Tag
  end

  struct SlideHddm
    tag : Stivale2::Tag
    flags : UInt64
    alignment : UInt64
  end

  struct UnmapNull
    tag : Stivale2::Tag
  end

  struct Smp
    tag : Stivale2::Tag
    flag : UInt64
  end
end

lib Tags
  enum Identifier : UInt64
    Pmrs              = 0x5df266a64047b6bd
    KernelBaseAddress = 0x060d78874a2a8af0
    Cmdline           = 0xe5e76a1b4597a781
    MemoryMap         = 0x2187f79e8612de07
    Framebuffer       = 0x506461d2950408fa
    FramebufferMtrr   = 0x6bc1a78ebe871172
    TextMode          = 0x38d74c23e0dca893
    Edid              = 0x968609d7af96b845
    Terminal          = 0xc2b3f4c3233b0974
    Modules           = 0x4b6fe466aade04ce
    Rsdp              = 0x9e1786930a375e78
    Smbios            = 0x274bd246c62bf7d1
    Epoch             = 0x566a7bed888e1407
    Firmware          = 0x359d837855e3858c
    EfiSystemTable    = 0x4bc5ec15845b558e
    KernelFile        = 0xe599d90c2975584a
    KernelFile2       = 0x37c13018a02c6ea2
    BootVolume        = 0x9b4358364c19ee62
    KernelSlide       = 0xee80847d01506c57
    Smp               = 0x34d1d96339647025
    PxeServerInfo     = 0x29d1e96239247032
    Mmio32Uart        = 0xb813f9b8dbc78797
    Dtb               = 0xabb29bd49a2833fa
    Hhdm              = 0xb0ed257db18cb58f
  end

  struct Pmrs
    tag : Stivale2::Tag
    entries : UInt64
    pmrs : PmrEntry[0]
  end

  struct PmrEntry
    base : UInt64
    length : UInt64
    permissions : PmrPermissions
  end

  @[Flags]
  enum PmrPermissions
    Executable
    Writable
    Readable
  end

  struct KernelBaseAddress
    tag : Stivale2::Tag
    physical_base_address : UInt64
    virtual_base_address : UInt64
  end

  struct Cmdline
    tag : Stivale2::Tag
    cmdline : UInt8*
  end

  struct MemoryMap
    tag : Stivale2::Tag
    entries : UInt64
    memmap : MmapEntry[0]
  end

  struct MmapEntry
    base : UInt64
    length : UInt64
    type : MmapType
    unused : UInt32
  end

  enum MmapType
    Usable                =      1
    Reserved              =      2
    AcpiReclaimable       =      3
    AcpiNvs               =      4
    BadMemory             =      5
    BootloaderReclaimable = 0x1000
    KernelAndModules      = 0x1001
    Framebuffer           = 0x1002
  end

  struct Framebuffer
    tag : Stivale2::Tag
    address : UInt64
    width : UInt16
    height : UInt16
    pitch : UInt16
    bpp : UInt16
    memory_model : UInt8
    red_mask_size : UInt8
    red_mask_shift : UInt8
    green_mask_size : UInt8
    green_mask_shift : UInt8
    blue_mask_size : UInt8
    blue_mask_shift : UInt8
    unused : UInt8
  end

  struct FramebufferMttr
    tag : Stivale2::Tag
  end

  struct TextMode
    tag : Stivale2::Tag
    address : UInt64
    unused : UInt16
    rows : UInt16
    cols : UInt16
    bytes_per_char : UInt16
  end

  struct Edid
    tag : Stivale2::Tag
    size : UInt64
    information : UInt8
  end

  struct Terminal
    tag : Stivale2::Tag
    flags : UInt32
    cols : UInt16
    term_write : (UInt8*, Int32 ->)
  end

  enum TermContextControl
    Size    = -1
    Save    = -2
    Restore = -3
    Refresh = -4
  end

  struct Modules
    tag : Stivale2::Tag
    count : UInt64
    modules : ModuleEntry[0]
  end

  struct ModuleEntry
    _begin : UInt64
    _end : UInt64
    string : UInt8[128]
  end

  struct Rdsp
    tag : Stivale2::Tag
    rdsp : UInt64
  end

  struct Smbios
    tag : Stivale2::Tag
    flags : UInt64
    entry32 : UInt64
    entry64 : UInt64
  end

  struct Epoch
    tag : Stivale2::Tag
    epoch : UInt64 # 2038-proof :^)
  end

  struct Firmware
    tag : Stivale2::Tag
    flags : UInt64
  end

  struct EfiSystemTable
    tag : Stivale2::Tag
    address : UInt64
  end

  struct KernelFile
    tag : Stivale2::Tag
    file : UInt64
  end

  struct KernelFile2
    tag : Stivale2::Tag
    file : UInt64
    size : UInt64
  end

  struct BootVolume
    tag : Stivale2::Tag
    flags : UInt64
    guid : Guid
    partition_guid : Guid
  end

  struct Guid
    a : UInt32
    b, c : UInt16
    d : UInt8[8]
  end

  struct KernelSlide
    tag : Stivale2::Tag
    slide : UInt64
  end

  struct Smp
    tag : Stivale2::Tag
    flags : UInt64
    bsp_lapic_id : UInt32
    unused : UInt32
    cpu_count : UInt64
    smp_info : SmpInfo[0]
  end

  struct SmpInfo
    processor_id : UInt32
    lapic_id : UInt32
    target_stack : UInt64
    goto_address : UInt64
    extra_argument : UInt64
  end

  struct PxeServerInfo
    tag : Stivale2::Tag
    server_ip : UInt32
  end

  struct Mmio32Uart
    tag : Stivale2::Tag
    address : UInt64
  end

  struct Dtb
    tag : Stivale2::Tag
    address : UInt64
    size : UInt64
  end

  struct Hhdm
    tag : Stivale2::Tag
    address : UInt64
  end
end
