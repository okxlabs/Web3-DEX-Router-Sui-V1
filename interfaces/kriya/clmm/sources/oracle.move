module kriya_clmm::oracle {
    struct Observation has copy, drop, store {
        timestamp_s: u64,
        tick_cumulative: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i64::I64,
        seconds_per_liquidity_cumulative: u256,
        initialized: bool,
    }
    
    public fun binary_search(arg0: &vector<Observation>, arg1: u64, arg2: u64, arg3: u64) : (Observation, Observation) {
        abort 0
    }
    
    fun default() : Observation {
        abort 0
    }
    
    public fun get_surrounding_observations(arg0: &vector<Observation>, arg1: u64, arg2: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, arg3: u64, arg4: u128, arg5: u64) : (Observation, Observation) {
        abort 0
    }
    
    public fun grow(arg0: &mut vector<Observation>, arg1: u64, arg2: u64) : u64 {
        abort 0
    }
    
    public fun initialize(arg0: &mut vector<Observation>, arg1: u64) : (u64, u64) {
        abort 0
    }
    
    public fun is_initialized(arg0: &Observation) : bool {
        abort 0
    }
    
    public fun observe(arg0: &vector<Observation>, arg1: u64, arg2: vector<u64>, arg3: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, arg4: u64, arg5: u128, arg6: u64) : (vector<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i64::I64>, vector<u256>) {
        abort 0
    }
    
    public fun observe_single(arg0: &vector<Observation>, arg1: u64, arg2: u64, arg3: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, arg4: u64, arg5: u128, arg6: u64) : (0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i64::I64, u256) {
        abort 0
    }
    
    public fun seconds_per_liquidity_cumulative(arg0: &Observation) : u256 {
        abort 0
    }
    
    public fun tick_cumulative(arg0: &Observation) : 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i64::I64 {
        abort 0
    }
    
    public fun timestamp_s(arg0: &Observation) : u64 {
        abort 0
    }
    
    public fun transform(arg0: &Observation, arg1: u64, arg2: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, arg3: u128) : Observation {
        abort 0
    }
    
    fun try_get_observation(arg0: &vector<Observation>, arg1: u64) : Observation {
        abort 0
    }
    
    public fun write(arg0: &mut vector<Observation>, arg1: u64, arg2: u64, arg3: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, arg4: u128, arg5: u64, arg6: u64) : (u64, u64) {
        abort 0
    }
    
    // decompiled from Move bytecode v6
}

