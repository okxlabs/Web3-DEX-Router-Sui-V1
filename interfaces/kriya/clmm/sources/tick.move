module kriya_clmm::tick {
    struct TickInfo has copy, drop, store {
        liquidity_gross: u128,
        liquidity_net: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i128::I128,
        fee_growth_outside_x: u128,
        fee_growth_outside_y: u128,
        reward_growths_outside: vector<u128>,
        tick_cumulative_out_side: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i64::I64,
        seconds_per_liquidity_out_side: u256,
        seconds_out_side: u64,
    }
    
    public(friend) fun update(arg0: &mut 0x2::table::Table<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, TickInfo>, arg1: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, arg2: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, arg3: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i128::I128, arg4: u128, arg5: u128, arg6: vector<u128>, arg7: u256, arg8: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i64::I64, arg9: u64, arg10: bool, arg11: u128) : bool {
        abort 0
    }
    
    public(friend) fun clear(arg0: &mut 0x2::table::Table<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, TickInfo>, arg1: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32) {
        abort 0
    }
    
    fun compute_reward_growths(arg0: vector<u128>, arg1: vector<u128>) : vector<u128> {
        abort 0
    }
    
    public(friend) fun cross(arg0: &mut 0x2::table::Table<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, TickInfo>, arg1: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, arg2: u128, arg3: u128, arg4: vector<u128>, arg5: u256, arg6: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i64::I64, arg7: u64) : 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i128::I128 {
        abort 0
    }
    
    public fun get_fee_and_reward_growths_inside(arg0: &0x2::table::Table<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, TickInfo>, arg1: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, arg2: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, arg3: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, arg4: u128, arg5: u128, arg6: vector<u128>) : (u128, u128, vector<u128>) {
        abort 0
    }
    
    public fun get_fee_and_reward_growths_outside(arg0: &0x2::table::Table<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, TickInfo>, arg1: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32) : (u128, u128, vector<u128>) {
        abort 0
    }
    
    public fun get_liquidity_gross(arg0: &0x2::table::Table<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, TickInfo>, arg1: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32) : u128 {
        abort 0
    }
    
    public fun get_liquidity_net(arg0: &0x2::table::Table<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, TickInfo>, arg1: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32) : 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i128::I128 {
        abort 0
    }
    
    public fun get_seconds_out_side(arg0: &0x2::table::Table<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, TickInfo>, arg1: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32) : u64 {
        abort 0
    }
    
    public fun get_seconds_per_liquidity_out_side(arg0: &0x2::table::Table<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, TickInfo>, arg1: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32) : u256 {
        abort 0
    }
    
    public fun get_tick_cumulative_out_side(arg0: &0x2::table::Table<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, TickInfo>, arg1: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32) : 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i64::I64 {
        abort 0
    }
    
    public fun is_initialized(arg0: &0x2::table::Table<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, TickInfo>, arg1: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32) : bool {
        abort 0
    }
    
    public fun tick_spacing_to_max_liquidity_per_tick(arg0: u32) : u128 {
        abort 0
    }
    
    fun try_borrow_mut_tick(arg0: &mut 0x2::table::Table<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, TickInfo>, arg1: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32) : &mut TickInfo {
        abort 0
    }
    
    public fun verify_tick(arg0: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, arg1: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, arg2: u32) {
        abort 0
    }
    
    // decompiled from Move bytecode v6
}

