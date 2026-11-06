module kriya_clmm::pool {
    struct Pool<phantom T0, phantom T1> has key {
        id: 0x2::object::UID,
        type_x: 0x1::type_name::TypeName,
        type_y: 0x1::type_name::TypeName,
        sqrt_price: u128,
        liquidity: u128,
        tick_index: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32,
        tick_spacing: u32,
        max_liquidity_per_tick: u128,
        fee_growth_global_x: u128,
        fee_growth_global_y: u128,
        reserve_x: 0x2::balance::Balance<T0>,
        reserve_y: 0x2::balance::Balance<T1>,
        swap_fee_rate: u64,
        flash_loan_fee_rate: u64,
        protocol_fee_share: u64,
        protocol_flash_loan_fee_share: u64,
        protocol_fee_x: u64,
        protocol_fee_y: u64,
        ticks: 0x2::table::Table<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::tick::TickInfo>,
        tick_bitmap: 0x2::table::Table<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, u256>,
        reward_infos: vector<PoolRewardInfo>,
        observation_index: u64,
        observation_cardinality: u64,
        observation_cardinality_next: u64,
        observations: vector<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::oracle::Observation>,
    }
    
    struct PoolRewardInfo has copy, drop, store {
        reward_coin_type: 0x1::type_name::TypeName,
        last_update_time: u64,
        ended_at_seconds: u64,
        total_reward: u64,
        total_reward_allocated: u64,
        reward_per_seconds: u128,
        reward_growth_global: u128,
    }
    
    struct PoolRewardCustodianDfKey<phantom T0> has copy, drop, store {
        dummy_field: bool,
    }
    
    struct ObservationCardinalityUpdatedEvent has copy, drop, store {
        sender: address,
        pool_id: 0x2::object::ID,
        observation_cardinality_next_old: u64,
        observation_cardinality_next_new: u64,
    }
    
    struct UpdatePoolRewardEmissionEvent has copy, drop, store {
        sender: address,
        pool_id: 0x2::object::ID,
        reward_coin_type: 0x1::type_name::TypeName,
        total_reward: u64,
        ended_at_seconds: u64,
        reward_per_seconds: u128,
    }
    
    public fun transfer<T0, T1>(arg0: Pool<T0, T1>) {
        abort 0
    }
    
    public fun initialize<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: u128, arg2: &0x2::clock::Clock) {
        abort 0
    }
    
    public fun observe<T0, T1>(arg0: &Pool<T0, T1>, arg1: vector<u64>, arg2: &0x2::clock::Clock) : (vector<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i64::I64>, vector<u256>) {
        abort 0
    }
    
    public fun pool_id<T0, T1>(arg0: &Pool<T0, T1>) : 0x2::object::ID {
        abort 0
    }
    
    public(friend) fun add_liquidity<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: &mut 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::position::Position, arg2: 0x2::balance::Balance<T0>, arg3: 0x2::balance::Balance<T1>, arg4: &0x2::clock::Clock) : (u64, u64, u128, 0x2::balance::Balance<T0>, 0x2::balance::Balance<T1>) {
        abort 0
    }
    
    public(friend) fun add_reward_info<T0, T1, T2>(arg0: &mut Pool<T0, T1>, arg1: PoolRewardInfo, arg2: &0x2::tx_context::TxContext) {
        abort 0
    }
    
    public(friend) fun add_to_reserves<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: 0x2::balance::Balance<T0>, arg2: 0x2::balance::Balance<T1>) {
        abort 0
    }
    
    public fun borrow_observations<T0, T1>(arg0: &Pool<T0, T1>) : &vector<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::oracle::Observation> {
        abort 0
    }
    
    public fun borrow_tick_bitmap<T0, T1>(arg0: &Pool<T0, T1>) : &0x2::table::Table<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, u256> {
        abort 0
    }
    
    public fun borrow_ticks<T0, T1>(arg0: &Pool<T0, T1>) : &0x2::table::Table<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::tick::TickInfo> {
        abort 0
    }
    
    public(friend) fun collect_fee<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: &mut 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::position::Position) : (0x2::balance::Balance<T0>, 0x2::balance::Balance<T1>) {
        abort 0
    }
    
    public(friend) fun collect_reward<T0, T1, T2>(arg0: &mut Pool<T0, T1>, arg1: &mut 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::position::Position) : 0x2::balance::Balance<T2> {
        abort 0
    }
    
    public(friend) fun create<T0, T1>(arg0: u32, arg1: u64, arg2: u64, arg3: u64, arg4: u64, arg5: &mut 0x2::tx_context::TxContext) : Pool<T0, T1> {
        abort 0
    }
    
    public(friend) fun default_reward_info(arg0: 0x1::type_name::TypeName, arg1: u64) : PoolRewardInfo {
        abort 0
    }
    
    public fun fee_growth_global_x<T0, T1>(arg0: &Pool<T0, T1>) : u128 {
        abort 0
    }
    
    public fun fee_growth_global_y<T0, T1>(arg0: &Pool<T0, T1>) : u128 {
        abort 0
    }
    
    fun find_reward_info_index<T0, T1, T2>(arg0: &Pool<T0, T1>) : u64 {
        abort 0
    }
    
    public fun flash_loan_fee_rate<T0, T1>(arg0: &Pool<T0, T1>) : u64 {
        abort 0
    }
    
    public fun get_friendly_ticks<T0, T1>(arg0: &Pool<T0, T1>, arg1: u128, arg2: u128) : (0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32) {
        abort 0
    }
    
    public fun get_reserves<T0, T1>(arg0: &Pool<T0, T1>) : (u64, u64) {
        abort 0
    }
    
    public(friend) fun increase_observation_cardinality_next<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: u64, arg2: &0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun liquidity<T0, T1>(arg0: &Pool<T0, T1>) : u128 {
        abort 0
    }
    
    public fun max_liquidity_per_tick<T0, T1>(arg0: &Pool<T0, T1>) : u128 {
        abort 0
    }
    
    public fun observation_cardinality<T0, T1>(arg0: &Pool<T0, T1>) : u64 {
        abort 0
    }
    
    public fun observation_cardinality_next<T0, T1>(arg0: &Pool<T0, T1>) : u64 {
        abort 0
    }
    
    public fun observation_index<T0, T1>(arg0: &Pool<T0, T1>) : u64 {
        abort 0
    }
    
    public(friend) fun observations_mut<T0, T1>(arg0: &mut Pool<T0, T1>) : &mut vector<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::oracle::Observation> {
        abort 0
    }
    
    public fun protocol_fee_share<T0, T1>(arg0: &Pool<T0, T1>) : u64 {
        abort 0
    }
    
    public fun protocol_fee_x<T0, T1>(arg0: &Pool<T0, T1>) : u64 {
        abort 0
    }
    
    public fun protocol_fee_y<T0, T1>(arg0: &Pool<T0, T1>) : u64 {
        abort 0
    }
    
    public fun protocol_flash_loan_fee_share<T0, T1>(arg0: &Pool<T0, T1>) : u64 {
        abort 0
    }
    
    public(friend) fun remove_liquidity<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: &mut 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::position::Position, arg2: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i128::I128, arg3: &0x2::clock::Clock) : (0x2::balance::Balance<T0>, 0x2::balance::Balance<T1>) {
        abort 0
    }
    
    public fun reserves<T0, T1>(arg0: &Pool<T0, T1>) : (u64, u64) {
        abort 0
    }
    
    public fun reward_coin_type<T0, T1>(arg0: &Pool<T0, T1>, arg1: u64) : 0x1::type_name::TypeName {
        abort 0
    }
    
    public fun reward_ended_at<T0, T1>(arg0: &Pool<T0, T1>, arg1: u64) : u64 {
        abort 0
    }
    
    public fun reward_growth_global<T0, T1>(arg0: &Pool<T0, T1>, arg1: u64) : u128 {
        abort 0
    }
    
    public fun reward_info_at<T0, T1>(arg0: &Pool<T0, T1>, arg1: u64) : &PoolRewardInfo {
        abort 0
    }
    
    public fun reward_last_update_at<T0, T1>(arg0: &Pool<T0, T1>, arg1: u64) : u64 {
        abort 0
    }
    
    public fun reward_length<T0, T1>(arg0: &Pool<T0, T1>) : u64 {
        abort 0
    }
    
    public fun reward_per_seconds<T0, T1>(arg0: &Pool<T0, T1>, arg1: u64) : u128 {
        abort 0
    }
    
    fun safe_withdraw<T0>(arg0: &mut 0x2::balance::Balance<T0>, arg1: u64) : 0x2::balance::Balance<T0> {
        abort 0
    }
    
    public(friend) fun set_fee_growth_global_x<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: u128) {
        abort 0
    }
    
    public(friend) fun set_fee_growth_global_y<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: u128) {
        abort 0
    }
    
    public(friend) fun set_liquidity<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: u128) {
        abort 0
    }
    
    public(friend) fun set_observation_cardinality<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: u64) {
        abort 0
    }
    
    public(friend) fun set_observation_index<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: u64) {
        abort 0
    }
    
    public(friend) fun set_protocol_fee_share<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: u64) {
        abort 0
    }
    
    public(friend) fun set_protocol_fee_x<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: u64) {
        abort 0
    }
    
    public(friend) fun set_protocol_fee_y<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: u64) {
        abort 0
    }
    
    public(friend) fun set_protocol_flash_loan_fee_share<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: u64) {
        abort 0
    }
    
    public(friend) fun set_sqrt_price<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: u128) {
        abort 0
    }
    
    public(friend) fun set_tick_index_current<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32) {
        abort 0
    }
    
    public fun sqrt_price<T0, T1>(arg0: &Pool<T0, T1>) : u128 {
        abort 0
    }
    
    public fun swap_fee_rate<T0, T1>(arg0: &Pool<T0, T1>) : u64 {
        abort 0
    }
    
    public(friend) fun take_from_reserves<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: u64, arg2: u64) : (0x2::balance::Balance<T0>, 0x2::balance::Balance<T1>) {
        abort 0
    }
    
    public(friend) fun tick_bitmap_mut<T0, T1>(arg0: &mut Pool<T0, T1>) : &mut 0x2::table::Table<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, u256> {
        abort 0
    }
    
    public fun tick_index_current<T0, T1>(arg0: &Pool<T0, T1>) : 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32 {
        abort 0
    }
    
    public fun tick_spacing<T0, T1>(arg0: &Pool<T0, T1>) : u32 {
        abort 0
    }
    
    public(friend) fun ticks_mut<T0, T1>(arg0: &mut Pool<T0, T1>) : &mut 0x2::table::Table<0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32, 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::tick::TickInfo> {
        abort 0
    }
    
    public fun total_reward<T0, T1>(arg0: &Pool<T0, T1>, arg1: u64) : u64 {
        abort 0
    }
    
    public fun total_reward_allocated<T0, T1>(arg0: &Pool<T0, T1>, arg1: u64) : u64 {
        abort 0
    }
    
    public fun type_x<T0, T1>(arg0: &Pool<T0, T1>) : 0x1::type_name::TypeName {
        abort 0
    }
    
    public fun type_y<T0, T1>(arg0: &Pool<T0, T1>) : 0x1::type_name::TypeName {
        abort 0
    }
    
    public(friend) fun update_data_for_delta_l<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: &mut 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::position::Position, arg2: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i128::I128, arg3: &0x2::clock::Clock) : (u64, u64) {
        abort 0
    }
    
    public(friend) fun update_reward_infos<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: u64) : vector<u128> {
        abort 0
    }
    
    public fun verify_pool<T0, T1>(arg0: &Pool<T0, T1>, arg1: 0x2::object::ID) {
        abort 0
    }
    
    // decompiled from Move bytecode v6
}

