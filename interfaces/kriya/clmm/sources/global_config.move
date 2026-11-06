module kriya_clmm::global_config {
    struct GlobalConfig has store, key {
        id: 0x2::object::UID,
        fee_amount_tick_spacing: 0x2::table::Table<u64, u32>,
    }
    
    public fun contains_fee_rate(arg0: &GlobalConfig, arg1: u64) : bool {
        abort 0
    }
    
    public fun enable_fee_rate(arg0: &0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::app::AdminCap, arg1: &mut GlobalConfig, arg2: u64, arg3: u32, arg4: &0x2::tx_context::TxContext) {
        abort 0
    }
    
    fun enable_fee_rate_internal(arg0: &mut GlobalConfig, arg1: u64, arg2: u32, arg3: &0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun get_tick_spacing(arg0: &GlobalConfig, arg1: u64) : u32 {
        abort 0
    }
    
    fun init(arg0: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    // decompiled from Move bytecode v6
}

