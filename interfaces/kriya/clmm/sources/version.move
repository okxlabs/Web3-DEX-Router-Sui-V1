module kriya_clmm::version {
    struct Version has store, key {
        id: 0x2::object::UID,
        major_version: u64,
        minor_version: u64,
    }
    
    struct VersionCap has store, key {
        id: 0x2::object::UID,
    }
    
    public fun assert_supported_version(arg0: &Version) {
        abort 0
    }
    
    fun init(arg0: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun is_supported_major_version(arg0: &Version) : bool {
        abort 0
    }
    
    public fun is_supported_minor_version(arg0: &Version) : bool {
        abort 0
    }
    
    public fun set_version(arg0: &mut Version, arg1: &VersionCap, arg2: u64, arg3: u64) {
        abort 0
    }
    
    public fun upgrade_major(arg0: &mut Version, arg1: &VersionCap) {
        abort 0
    }
    
    public fun upgrade_minor(arg0: &mut Version, arg1: u64, arg2: &VersionCap) {
        abort 0
    }
    
    public fun value_major(arg0: &Version) : u64 {
        abort 0
    }
    
    public fun value_minor(arg0: &Version) : u64 {
        abort 0
    }
    
    // decompiled from Move bytecode v6
}

