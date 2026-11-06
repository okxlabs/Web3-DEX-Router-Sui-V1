module bluemove::stable_swap {
    struct LSP<phantom T0, phantom T1> has drop {
        dummy_field: bool,
    }
    
    struct Stable_Pool<phantom T0, phantom T1> has store, key {
        id: 0x2::object::UID,
        creator: address,
        token_x: 0x2::balance::Balance<T0>,
        token_y: 0x2::balance::Balance<T1>,
        lsp_supply: 0x2::balance::Supply<LSP<T0, T1>>,
        fee_x: 0x2::balance::Balance<T0>,
        fee_y: 0x2::balance::Balance<T1>,
        last_price_x_cumulative: u128,
        last_price_y_cumulative: u128,
        x_scale: u64,
        y_scale: u64,
        is_freeze: bool,
        fee: u64,
        dao_fee: u64,
        last_block_timestamp: u64,
    }
    
    struct Dex_Stable_Info has store, key {
        id: 0x2::object::UID,
        fee_to: address,
        dev: address,
        total_pool_created: u64,
    }
    
    struct Created_Stable_Pool_Event has copy, drop {
        pool_id: 0x2::object::ID,
        creator: address,
        token_x_name: 0x1::string::String,
        token_y_name: 0x1::string::String,
        token_x_amount_in: u64,
        token_y_amount_in: u64,
        lsp_balance: u64,
    }
    
    struct Add_Liquidity_Stable_Pool_Event has copy, drop {
        pool_id: 0x2::object::ID,
        user: address,
        token_x_name: 0x1::string::String,
        token_y_name: 0x1::string::String,
        token_x_amount_in: u64,
        token_y_amount_in: u64,
        lsp_balance: u64,
    }
    
    struct Remove_Liqidity_Stable_Pool_Event has copy, drop {
        pool_id: 0x2::object::ID,
        user: address,
        token_x_name: 0x1::string::String,
        token_y_name: 0x1::string::String,
        token_x_amount_out: u64,
        token_y_amount_out: u64,
    }
    
    struct Stable_Swap_Event<phantom T0, phantom T1> has copy, drop {
        pool_id: 0x2::object::ID,
        user: address,
        token_x_in: 0x1::string::String,
        amount_x_in: u64,
        token_y_in: 0x1::string::String,
        amount_y_in: u64,
        token_x_out: 0x1::string::String,
        amount_x_out: u64,
        token_y_out: 0x1::string::String,
        amount_y_out: u64,
    }
    
    struct Freeze_Stable_Pool_Event<phantom T0, phantom T1> has copy, drop {
        pool_id: 0x2::object::ID,
        token_x_name: 0x1::string::String,
        amount_x: u64,
        token_y_name: 0x1::string::String,
        amount_y: u64,
        lsp_balance: u64,
        is_freeze: bool,
    }
    
    fun swap<T0, T1>(arg0: &mut Stable_Pool<T0, T1>, arg1: &0x2::clock::Clock, arg2: 0x2::coin::Coin<T0>, arg3: u64, arg4: 0x2::coin::Coin<T1>, arg5: u64, arg6: &mut 0x2::tx_context::TxContext) : (0x2::coin::Coin<T0>, 0x2::coin::Coin<T1>) {
        abort 0
    }
    
    public fun add_stable_swap_event_internal<T0, T1>(arg0: u64, arg1: u64, arg2: u64, arg3: u64, arg4: &mut Dex_Stable_Info, arg5: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun add_stable_swap_event_with_address<T0, T1>(arg0: address, arg1: u64, arg2: u64, arg3: u64, arg4: u64, arg5: &mut Stable_Pool<T0, T1>) {
        abort 0
    }
    
    fun add_stable_swap_event_with_address_internal<T0, T1>(arg0: address, arg1: u64, arg2: u64, arg3: u64, arg4: u64, arg5: &mut Dex_Stable_Info) {
        abort 0
    }
    
    fun assert_lp_value_is_increased(arg0: u64, arg1: u64, arg2: u128, arg3: u128, arg4: u128, arg5: u128) {
        abort 0
    }
    
    public fun calc_optimal_coin_values<T0, T1>(arg0: &mut Stable_Pool<T0, T1>, arg1: u64, arg2: u64, arg3: u64, arg4: u64) : (u64, u64) {
        abort 0
    }
    
    public fun check_stable_pool_exist<T0, T1>(arg0: &Dex_Stable_Info) : bool {
        abort 0
    }
    
    public fun convert_with_current_price(arg0: u64, arg1: u64, arg2: u64) : u64 {
        abort 0
    }
    
    public(friend) fun create_pool<T0, T1>(arg0: u8, arg1: u8, arg2: u64, arg3: u64, arg4: &mut Dex_Stable_Info, arg5: &0x2::clock::Clock, arg6: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    fun create_stable_pool_internal<T0, T1>(arg0: u8, arg1: u8, arg2: u64, arg3: u64, arg4: &mut Dex_Stable_Info, arg5: &0x2::clock::Clock, arg6: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public entry fun freeze_stable_pool<T0, T1>(arg0: bool, arg1: &mut Dex_Stable_Info, arg2: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    fun freeze_stable_pool_internal<T0, T1>(arg0: &mut Stable_Pool<T0, T1>, arg1: bool) {
        abort 0
    }
    
    public fun get_amount_in<T0, T1>(arg0: u64, arg1: u64, arg2: u64, arg3: u64, arg4: u64, arg5: u64, arg6: u64) : u64 {
        abort 0
    }
    
    public fun get_amount_out<T0, T1>(arg0: u64, arg1: u64, arg2: u64, arg3: u64, arg4: u64, arg5: u64, arg6: u64) : u64 {
        abort 0
    }
    
    fun get_coin_in_with_fees<T0, T1>(arg0: u64, arg1: u64, arg2: u64, arg3: u64, arg4: u64, arg5: u64, arg6: u64) : u64 {
        abort 0
    }
    
    fun get_coin_out_with_fees<T0, T1>(arg0: u64, arg1: u64, arg2: u64, arg3: u64, arg4: u64, arg5: u64, arg6: u64) : u64 {
        abort 0
    }
    
    public fun get_cumulative_prices<T0, T1>(arg0: &mut Stable_Pool<T0, T1>) : (u128, u128) {
        abort 0
    }
    
    public fun get_decimals_scales<T0, T1>(arg0: &mut Stable_Pool<T0, T1>) : (u64, u64) {
        abort 0
    }
    
    public fun get_fees_config<T0, T1>(arg0: &mut Stable_Pool<T0, T1>) : (u64, u64) {
        abort 0
    }
    
    public fun get_reserves_size<T0, T1>(arg0: &mut Dex_Stable_Info) : (u64, u64) {
        abort 0
    }
    
    public fun get_stable_pool<T0, T1>(arg0: &mut Dex_Stable_Info) : &mut Stable_Pool<T0, T1> {
        abort 0
    }
    
    fun init(arg0: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    fun new_reserves_after_fees_scaled(arg0: u64, arg1: u64, arg2: u64, arg3: u64, arg4: u64) : (u128, u128) {
        abort 0
    }
    
    public entry fun set_dao_fee<T0, T1>(arg0: &mut Stable_Pool<T0, T1>, arg1: &mut Dex_Stable_Info, arg2: u64, arg3: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public entry fun set_dev_account(arg0: &mut Dex_Stable_Info, arg1: address, arg2: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public entry fun set_fee<T0, T1>(arg0: &mut Stable_Pool<T0, T1>, arg1: &mut Dex_Stable_Info, arg2: u64, arg3: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public entry fun set_fee_config<T0, T1>(arg0: u64, arg1: u64, arg2: &mut Dex_Stable_Info, arg3: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public entry fun set_fee_to(arg0: &mut Dex_Stable_Info, arg1: address, arg2: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    fun split_fee_to_dao<T0, T1>(arg0: &mut Stable_Pool<T0, T1>, arg1: u64, arg2: u64) {
        abort 0
    }
    
    fun stable_burn<T0, T1>(arg0: &mut Stable_Pool<T0, T1>, arg1: &0x2::clock::Clock, arg2: 0x2::coin::Coin<LSP<T0, T1>>, arg3: &mut 0x2::tx_context::TxContext) : (0x2::coin::Coin<T0>, 0x2::coin::Coin<T1>) {
        abort 0
    }
    
    fun stable_mint<T0, T1>(arg0: &mut Stable_Pool<T0, T1>, arg1: &0x2::clock::Clock, arg2: 0x2::coin::Coin<T0>, arg3: 0x2::coin::Coin<T1>, arg4: &mut 0x2::tx_context::TxContext) : 0x2::coin::Coin<LSP<T0, T1>> {
        abort 0
    }
    
    public(friend) fun swap_coin_for_coin_unchecked<T0, T1>(arg0: &mut Stable_Pool<T0, T1>, arg1: &0x2::clock::Clock, arg2: 0x2::coin::Coin<T0>, arg3: u64, arg4: &mut 0x2::tx_context::TxContext) : 0x2::coin::Coin<T1> {
        abort 0
    }
    
    public(friend) fun swap_coin_for_coin_unchecked_<T0, T1>(arg0: &mut Stable_Pool<T0, T1>, arg1: &0x2::clock::Clock, arg2: 0x2::coin::Coin<T1>, arg3: u64, arg4: &mut 0x2::tx_context::TxContext) : 0x2::coin::Coin<T0> {
        abort 0
    }
    
    public(friend) fun swap_exact_x_to_y<T0, T1>(arg0: &mut Stable_Pool<T0, T1>, arg1: &0x2::clock::Clock, arg2: 0x2::coin::Coin<T0>, arg3: u64, arg4: &mut 0x2::tx_context::TxContext) : 0x2::coin::Coin<T1> {
        abort 0
    }
    
    public(friend) fun swap_exact_y_to_x<T0, T1>(arg0: &mut Stable_Pool<T0, T1>, arg1: &0x2::clock::Clock, arg2: 0x2::coin::Coin<T1>, arg3: u64, arg4: &mut 0x2::tx_context::TxContext) : 0x2::coin::Coin<T0> {
        abort 0
    }
    
    public(friend) fun swap_x_to_exact_y<T0, T1>(arg0: &mut Stable_Pool<T0, T1>, arg1: &0x2::clock::Clock, arg2: 0x2::coin::Coin<T0>, arg3: u64, arg4: &mut 0x2::tx_context::TxContext) : (0x2::coin::Coin<T1>, u64) {
        abort 0
    }
    
    public(friend) fun swap_y_to_exact_x<T0, T1>(arg0: &mut Stable_Pool<T0, T1>, arg1: &0x2::clock::Clock, arg2: 0x2::coin::Coin<T1>, arg3: u64, arg4: &mut 0x2::tx_context::TxContext) : (0x2::coin::Coin<T0>, u64) {
        abort 0
    }
    
    fun update_oracle<T0, T1>(arg0: &mut Stable_Pool<T0, T1>, arg1: &0x2::clock::Clock, arg2: u64, arg3: u64) {
        abort 0
    }
    
    public entry fun withdraw_fee_stable_pool<T0, T1>(arg0: &mut Dex_Stable_Info, arg1: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    fun withdraw_fee_stable_pool_internal<T0, T1>(arg0: &mut Stable_Pool<T0, T1>, arg1: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    // decompiled from Move bytecode v6
}