module bluemove::utils {
    public fun compare_u8_vector(arg0: vector<u8>, arg1: vector<u8>) : u8 {
        abort 0
    }
    
    public fun destroy_zero_coin<T0>(arg0: 0x2::coin::Coin<T0>, arg1: address) {
        abort 0
    }
    
    public fun get_amount_in(arg0: u64, arg1: u64, arg2: u64) : u64 {
        abort 0
    }
    
    public fun get_amount_out(arg0: u64, arg1: u64, arg2: u64) : u64 {
        abort 0
    }
    
    public fun get_equal_enum() : u8 {
        0
    }
    
    public fun get_greater_enum() : u8 {
        2
    }
    
    public fun get_lp_name<T0, T1>() : 0x1::string::String {
        abort 0
    }
    
    public fun get_smaller_enum() : u8 {
        1
    }
    
    public fun get_token_name<T0>() : 0x1::string::String {
        abort 0
    }
    
    public fun quote(arg0: u64, arg1: u64, arg2: u64) : u64 {
        abort 0
    }
    
    public fun sort_token_type<T0, T1>() : bool {
        abort 0
    }
    
    public fun split_and_keep_coin<T0>(arg0: u64, arg1: vector<0x2::coin::Coin<T0>>, arg2: &mut 0x2::tx_context::TxContext) : 0x2::coin::Coin<T0> {
        abort 0
    }
    
    public fun to_bytes<T0>() : vector<u8> {
        abort 0
    }
    
    // decompiled from Move bytecode v6
}