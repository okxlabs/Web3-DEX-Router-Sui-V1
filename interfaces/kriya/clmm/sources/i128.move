module kriya_clmm::i128 {
    struct I128 has copy, drop, store {
        bits: u128,
    }
    
    public fun from(arg0: u128) : I128 {
        abort 0
    }
    
    public fun neg_from(arg0: u128) : I128 {
        abort 0
    }
    
    public fun abs(arg0: I128) : I128 {
        abort 0
    }
    
    public fun abs_u128(arg0: I128) : u128 {
        abort 0
    }
    
    public fun add(arg0: I128, arg1: I128) : I128 {
        abort 0
    }
    
    public fun and(arg0: I128, arg1: I128) : I128 {
        abort 0
    }
    
    public fun as_i32(arg0: I128) : 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32 {
        abort 0
    }
    
    public fun as_i64(arg0: I128) : 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i64::I64 {
        abort 0
    }
    
    public fun as_u128(arg0: I128) : u128 {
        abort 0
    }
    
    public fun cmp(arg0: I128, arg1: I128) : u8 {
        abort 0
    }
    
    public fun div(arg0: I128, arg1: I128) : I128 {
        abort 0
    }
    
    public fun eq(arg0: I128, arg1: I128) : bool {
        abort 0
    }
    
    public fun gt(arg0: I128, arg1: I128) : bool {
        abort 0
    }
    
    public fun gte(arg0: I128, arg1: I128) : bool {
        abort 0
    }
    
    public fun is_neg(arg0: I128) : bool {
        abort 0
    }
    
    public fun lt(arg0: I128, arg1: I128) : bool {
        abort 0
    }
    
    public fun lte(arg0: I128, arg1: I128) : bool {
        abort 0
    }
    
    public fun mul(arg0: I128, arg1: I128) : I128 {
        abort 0
    }
    
    public fun neg(arg0: I128) : I128 {
        abort 0
    }
    
    public fun or(arg0: I128, arg1: I128) : I128 {
        abort 0
    }
    
    public fun overflowing_add(arg0: I128, arg1: I128) : (I128, bool) {
        abort 0
    }
    
    public fun overflowing_sub(arg0: I128, arg1: I128) : (I128, bool) {
        abort 0
    }
    
    public fun shl(arg0: I128, arg1: u8) : I128 {
        abort 0
    }
    
    public fun shr(arg0: I128, arg1: u8) : I128 {
        abort 0
    }
    
    public fun sign(arg0: I128) : u8 {
        abort 0
    }
    
    public fun sub(arg0: I128, arg1: I128) : I128 {
        abort 0
    }
    
    fun u128_neg(arg0: u128) : u128 {
        abort 0
    }
    
    fun u8_neg(arg0: u8) : u8 {
        abort 0
    }
    
    public fun wrapping_add(arg0: I128, arg1: I128) : I128 {
        abort 0
    }
    
    public fun wrapping_sub(arg0: I128, arg1: I128) : I128 {
        abort 0
    }
    
    public fun zero() : I128 {
        abort 0
    }
    
    // decompiled from Move bytecode v6
}

