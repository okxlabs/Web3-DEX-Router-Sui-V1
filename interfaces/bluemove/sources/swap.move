module bluemove::swap {
    struct Created_Pool_Event has copy, drop {
        pool_id: 0x2::object::ID,
        creator: address,
        token_x_name: 0x1::string::String,
        token_y_name: 0x1::string::String,
        token_x_amount_in: u64,
        token_y_amount_in: u64,
        lsp_balance: u64,
    }
    
    struct Add_Liquidity_Pool has copy, drop {
        pool_id: 0x2::object::ID,
        user: address,
        token_x_name: 0x1::string::String,
        token_y_name: 0x1::string::String,
        token_x_amount_in: u64,
        token_y_amount_in: u64,
        lsp_balance: u64,
        fee_amount: u64,
    }
    
    struct Remove_Liqidity_Pool has copy, drop {
        pool_id: 0x2::object::ID,
        user: address,
        token_x_name: 0x1::string::String,
        token_y_name: 0x1::string::String,
        token_x_amount_out: u64,
        token_y_amount_out: u64,
        fee_amount: u64,
    }
    
    struct Swap_Event<phantom T0, phantom T1> has copy, drop {
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
    
    struct Freeze_Event has copy, drop {
        pool_id: 0x2::object::ID,
        token_x_in: 0x1::string::String,
        token_y_out: 0x1::string::String,
        lsp_balance: u64,
        is_freeze: bool,
    }
    
    struct LSP<phantom T0, phantom T1> has drop {
        dummy_field: bool,
    }
    
    struct Pool<phantom T0, phantom T1> has store, key {
        id: 0x2::object::UID,
        creator: address,
        token_x: 0x2::balance::Balance<T0>,
        token_y: 0x2::balance::Balance<T1>,
        lsp_supply: 0x2::balance::Supply<LSP<T0, T1>>,
        fee_amount: 0x2::balance::Balance<LSP<T0, T1>>,
        fee_x: 0x2::balance::Balance<T0>,
        fee_y: 0x2::balance::Balance<T1>,
        minimum_liq: 0x2::balance::Balance<LSP<T0, T1>>,
        k_last: u128,
        reserve_x: u64,
        reserve_y: u64,
        is_freeze: bool,
    }
    
    struct Dex_Info has store, key {
        id: 0x2::object::UID,
        fee_to: address,
        dev: address,
        total_pool_created: u64,
    }
    
    fun update<T0, T1>(arg0: u64, arg1: u64, arg2: &mut Pool<T0, T1>) {
        abort 0
    }
    
    fun swap<T0, T1>(arg0: u64, arg1: u64, arg2: &mut Pool<T0, T1>, arg3: &mut 0x2::tx_context::TxContext) : (0x2::coin::Coin<T0>, 0x2::coin::Coin<T1>) {
        abort 0
    }
    
    
    fun add_liquidity_direct<T0, T1>(arg0: 0x2::coin::Coin<T0>, arg1: 0x2::coin::Coin<T1>, arg2: &mut Pool<T0, T1>, arg3: &mut 0x2::tx_context::TxContext) : (u64, u64, 0x2::coin::Coin<LSP<T0, T1>>, u64, 0x2::coin::Coin<T0>, 0x2::coin::Coin<T1>) {
        abort 0
    }
    
    public fun add_swap_event_internal<T0, T1>(arg0: u64, arg1: u64, arg2: u64, arg3: u64, arg4: &mut Dex_Info, arg5: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun add_swap_event_with_address<T0, T1>(arg0: address, arg1: u64, arg2: u64, arg3: u64, arg4: u64, arg5: &mut Pool<T0, T1>) {
        abort 0
    }
    
    fun add_swap_event_with_address_internal<T0, T1>(arg0: address, arg1: u64, arg2: u64, arg3: u64, arg4: u64, arg5: &mut Dex_Info) {
        abort 0
    }
    
    public fun assert_input_amount<T0>(arg0: u64, arg1: &0x2::coin::Coin<T0>) {
        abort 0
    }
    
    fun burn<T0, T1>(arg0: 0x2::coin::Coin<LSP<T0, T1>>, arg1: &mut Pool<T0, T1>, arg2: &mut 0x2::tx_context::TxContext) : (0x2::coin::Coin<T0>, 0x2::coin::Coin<T1>, u64) {
        abort 0
    }
    
    public fun check_pool_exist<T0, T1>(arg0: &Dex_Info) : bool {
        abort 0
    }
    
    public(friend) fun create_new_pool<T0, T1>(arg0: &mut Dex_Info, arg1: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public entry fun create_new_pool_admin<T0, T1>(arg0: &mut Dex_Info, arg1: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    fun create_pool_internal<T0, T1>(arg0: &mut Dex_Info, arg1: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public entry fun freeze_pool<T0, T1>(arg0: bool, arg1: &mut Dex_Info, arg2: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun get_amounts<T0, T1>(arg0: &Pool<T0, T1>) : (u64, u64, u64) {
        abort 0
    }
    
    public fun get_pool<T0, T1>(arg0: &mut Dex_Info) : &mut Pool<T0, T1> {
        abort 0
    }
    
    fun init(arg0: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    fun mint<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: &mut 0x2::tx_context::TxContext) : (0x2::coin::Coin<LSP<T0, T1>>, u64) {
        abort 0
    }
    
    fun mint_fee<T0, T1>(arg0: &mut Pool<T0, T1>) : u64 {
        abort 0
    }
    
    fun remove_liquidity_direct<T0, T1>(arg0: 0x2::coin::Coin<LSP<T0, T1>>, arg1: &mut Pool<T0, T1>, arg2: &mut 0x2::tx_context::TxContext) : (0x2::coin::Coin<T0>, 0x2::coin::Coin<T1>, u64) {
        abort 0
    }
    
    public entry fun set_fee_to(arg0: &mut Dex_Info, arg1: address, arg2: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public(friend) fun swap_exact_x_to_y<T0, T1>(arg0: u64, arg1: 0x2::coin::Coin<T0>, arg2: address, arg3: &mut Pool<T0, T1>, arg4: &mut 0x2::tx_context::TxContext) : (u64, 0x2::coin::Coin<T1>) {
        abort 0
    }
    
    public(friend) fun swap_exact_x_to_y_direct<T0, T1>(arg0: 0x2::coin::Coin<T0>, arg1: &mut Pool<T0, T1>, arg2: &mut 0x2::tx_context::TxContext) : (0x2::coin::Coin<T0>, 0x2::coin::Coin<T1>) {
        abort 0
    }
    
    public(friend) fun swap_exact_y_to_x<T0, T1>(arg0: u64, arg1: 0x2::coin::Coin<T1>, arg2: &mut Pool<T0, T1>, arg3: address, arg4: &mut 0x2::tx_context::TxContext) : (u64, 0x2::coin::Coin<T0>) {
        abort 0
    }
    
    public(friend) fun swap_exact_y_to_x_direct<T0, T1>(arg0: 0x2::coin::Coin<T1>, arg1: &mut Pool<T0, T1>, arg2: &mut 0x2::tx_context::TxContext) : (0x2::coin::Coin<T0>, 0x2::coin::Coin<T1>) {
        abort 0
    }
    
    public(friend) fun swap_x_to_exact_y<T0, T1>(arg0: u64, arg1: 0x2::coin::Coin<T0>, arg2: u64, arg3: address, arg4: &mut Pool<T0, T1>, arg5: &mut 0x2::tx_context::TxContext) : (u64, 0x2::coin::Coin<T1>) {
        abort 0
    }
    
    public(friend) fun swap_x_to_exact_y_direct<T0, T1>(arg0: 0x2::coin::Coin<T0>, arg1: u64, arg2: &mut Pool<T0, T1>, arg3: &mut 0x2::tx_context::TxContext) : (0x2::coin::Coin<T0>, 0x2::coin::Coin<T1>) {
        abort 0
    }
    
    public(friend) fun swap_y_to_exact_x<T0, T1>(arg0: u64, arg1: 0x2::coin::Coin<T1>, arg2: u64, arg3: address, arg4: &mut Pool<T0, T1>, arg5: &mut 0x2::tx_context::TxContext) : (u64, 0x2::coin::Coin<T0>) {
        abort 0
    }
    
    public(friend) fun swap_y_to_exact_x_direct<T0, T1>(arg0: 0x2::coin::Coin<T1>, arg1: u64, arg2: &mut Pool<T0, T1>, arg3: &mut 0x2::tx_context::TxContext) : (0x2::coin::Coin<T0>, 0x2::coin::Coin<T1>) {
        abort 0
    }
    
    public fun token_balances<T0, T1>(arg0: &Pool<T0, T1>) : (u64, u64) {
        abort 0
    }
    
    public fun token_reserves<T0, T1>(arg0: &Pool<T0, T1>) : (u64, u64) {
        abort 0
    }
    
    public entry fun withdraw_fee<T0, T1>(arg0: &mut Dex_Info, arg1: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    // decompiled from Move bytecode v6
}