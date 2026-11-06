module kriya_clmm::position {
    struct POSITION has drop {
        dummy_field: bool,
    }
    
    struct Position has store, key {
        id: 0x2::object::UID,
        pool_id: 0x2::object::ID,
        fee_rate: u64,
        type_x: 0x1::type_name::TypeName,
        type_y: 0x1::type_name::TypeName,
        tick_lower_index: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32,
        tick_upper_index: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32,
        liquidity: u128,
        fee_growth_inside_x_last: u128,
        fee_growth_inside_y_last: u128,
        owed_coin_x: u64,
        owed_coin_y: u64,
        reward_infos: vector<PositionRewardInfo>,
    }
    
    struct PositionRewardInfo has copy, drop, store {
        reward_growth_inside_last: u128,
        coins_owed_reward: u64,
    }
    
    public(friend) fun update(arg0: &mut Position, arg1: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i128::I128, arg2: u128, arg3: u128, arg4: vector<u128>) {
        abort 0
    }
    
    public(friend) fun close(arg0: Position) {
        abort 0
    }
    
    public fun coins_owed_reward(arg0: &Position, arg1: u64) : u64 {
        abort 0
    }
    
    public(friend) fun decrease_owed_amount(arg0: &mut Position, arg1: u64, arg2: u64) {
        abort 0
    }
    
    public(friend) fun decrease_reward_debt(arg0: &mut Position, arg1: u64, arg2: u64) {
        abort 0
    }
    
    public fun fee_growth_inside_x_last(arg0: &Position) : u128 {
        abort 0
    }
    
    public fun fee_growth_inside_y_last(arg0: &Position) : u128 {
        abort 0
    }
    
    public fun fee_rate(arg0: &Position) : u64 {
        abort 0
    }
    
    public(friend) fun increase_owed_amount(arg0: &mut Position, arg1: u64, arg2: u64) {
        abort 0
    }
    
    fun init(arg0: POSITION, arg1: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun is_empty(arg0: &Position) : bool {
        abort 0
    }
    
    public fun liquidity(arg0: &Position) : u128 {
        abort 0
    }
    
    public(friend) fun open(arg0: 0x2::object::ID, arg1: u64, arg2: 0x1::type_name::TypeName, arg3: 0x1::type_name::TypeName, arg4: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, arg5: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, arg6: &mut 0x2::tx_context::TxContext) : Position {
        abort 0
    }
    
    public fun owed_coin_x(arg0: &Position) : u64 {
        abort 0
    }
    
    public fun owed_coin_y(arg0: &Position) : u64 {
        abort 0
    }
    
    public fun pool_id(arg0: &Position) : 0x2::object::ID {
        abort 0
    }
    
    public fun reward_growth_inside_last(arg0: &Position, arg1: u64) : u128 {
        abort 0
    }
    
    public fun reward_length(arg0: &Position) : u64 {
        abort 0
    }
    
    public fun tick_lower_index(arg0: &Position) : 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32 {
        abort 0
    }
    
    public fun tick_upper_index(arg0: &Position) : 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32 {
        abort 0
    }
    
    fun try_borrow_mut_reward_info(arg0: &mut Position, arg1: u64) : &mut PositionRewardInfo {
        abort 0
    }
    
    fun update_reward_infos(arg0: &mut Position, arg1: vector<u128>) {
        abort 0
    }
    
    // decompiled from Move bytecode v6
}

