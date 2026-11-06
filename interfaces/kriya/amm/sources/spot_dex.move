module kriya_amm::spot_dex {
    struct LSP<phantom T0, phantom T1> has drop {
        dummy_field: bool,
    }
    
    struct KriyaLPToken<phantom T0, phantom T1> has store, key {
        id: 0x2::object::UID,
        pool_id: 0x2::object::ID,
        lsp: 0x2::coin::Coin<LSP<T0, T1>>,
    }
    
    struct ProtocolConfigs has key {
        id: 0x2::object::UID,
        protocol_fee_percent_uc: u64,
        lp_fee_percent_uc: u64,
        protocol_fee_percent_stable: u64,
        lp_fee_percent_stable: u64,
        is_swap_enabled: bool,
        is_deposit_enabled: bool,
        is_withdraw_enabled: bool,
        admin: address,
        whitelisted_addresses: 0x2::table::Table<address, bool>,
    }
    
    struct Pool<phantom T0, phantom T1> has key {
        id: 0x2::object::UID,
        token_y: 0x2::balance::Balance<T1>,
        token_x: 0x2::balance::Balance<T0>,
        lsp_supply: 0x2::balance::Supply<LSP<T0, T1>>,
        lsp_locked: 0x2::balance::Balance<LSP<T0, T1>>,
        lp_fee_percent: u64,
        protocol_fee_percent: u64,
        protocol_fee_x: 0x2::balance::Balance<T0>,
        protocol_fee_y: 0x2::balance::Balance<T1>,
        is_stable: bool,
        scaleX: u64,
        scaleY: u64,
        is_swap_enabled: bool,
        is_deposit_enabled: bool,
        is_withdraw_enabled: bool,
    }
    
    struct PoolCreatedEvent has copy, drop {
        pool_id: 0x2::object::ID,
        creator: address,
        lp_fee_percent: u64,
        protocol_fee_percent: u64,
        is_stable: bool,
        scaleX: u64,
        scaleY: u64,
    }
    
    struct PoolUpdatedEvent has copy, drop {
        pool_id: 0x2::object::ID,
        lp_fee_percent: u64,
        protocol_fee_percent: u64,
        is_stable: bool,
        scaleX: u64,
        scaleY: u64,
    }
    
    struct LiquidityAddedEvent has copy, drop {
        pool_id: 0x2::object::ID,
        liquidity_provider: address,
        amount_x: u64,
        amount_y: u64,
        lsp_minted: u64,
    }
    
    struct LiquidityRemovedEvent has copy, drop {
        pool_id: 0x2::object::ID,
        liquidity_provider: address,
        amount_x: u64,
        amount_y: u64,
        lsp_burned: u64,
    }
    
    struct SwapEvent<phantom T0> has copy, drop {
        pool_id: 0x2::object::ID,
        user: address,
        reserve_x: u64,
        reserve_y: u64,
        amount_in: u64,
        amount_out: u64,
    }
    
    struct ConfigUpdatedEvent has copy, drop {
        protocol_fee_percent_uc: u64,
        lp_fee_percent_uc: u64,
        protocol_fee_percent_stable: u64,
        lp_fee_percent_stable: u64,
        is_swap_enabled: bool,
        is_deposit_enabled: bool,
        is_withdraw_enabled: bool,
        admin: address,
    }
    
    struct WhitelistUpdatedEvent has copy, drop {
        addr: address,
        is_whitelisted: bool,
    }
    
    public fun add_liquidity<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: 0x2::coin::Coin<T1>, arg2: 0x2::coin::Coin<T0>, arg3: u64, arg4: u64, arg5: u64, arg6: u64, arg7: &mut 0x2::tx_context::TxContext) : KriyaLPToken<T0, T1> {
        abort 0
    }
    
    public entry fun add_liquidity_<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: 0x2::coin::Coin<T1>, arg2: 0x2::coin::Coin<T0>, arg3: u64, arg4: u64, arg5: u64, arg6: u64, arg7: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    fun assert_lp_value_is_increased(arg0: bool, arg1: u64, arg2: u64, arg3: u128, arg4: u128, arg5: u128, arg6: u128) {
        abort 0
    }
    
    public entry fun claim_fees<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: &ProtocolConfigs, arg2: u64, arg3: u64, arg4: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun create_pool<T0, T1>(arg0: &ProtocolConfigs, arg1: bool, arg2: &0x2::coin::CoinMetadata<T0>, arg3: &0x2::coin::CoinMetadata<T1>, arg4: &mut 0x2::tx_context::TxContext) : Pool<T0, T1> {
        abort 0
    }
    
    public entry fun create_pool_<T0, T1>(arg0: &ProtocolConfigs, arg1: bool, arg2: &0x2::coin::CoinMetadata<T0>, arg3: &0x2::coin::CoinMetadata<T1>, arg4: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    fun emit_config_updated_event(arg0: &ProtocolConfigs) {
        abort 0
    }
    
    fun emit_liquidity_added_event(arg0: 0x2::object::ID, arg1: address, arg2: u64, arg3: u64, arg4: u64) {
        abort 0
    }
    
    fun emit_liquidity_removed_event(arg0: 0x2::object::ID, arg1: address, arg2: u64, arg3: u64, arg4: u64) {
        abort 0
    }
    
    fun emit_pool_created_event<T0, T1>(arg0: &Pool<T0, T1>, arg1: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    fun emit_pool_updated_event<T0, T1>(arg0: &Pool<T0, T1>) {
        abort 0
    }
    
    fun emit_swap_event<T0>(arg0: 0x2::object::ID, arg1: address, arg2: u64, arg3: u64, arg4: u64, arg5: u64) {
        abort 0
    }
    
    fun emit_whitelist_event(arg0: address, arg1: bool) {
        abort 0
    }
    
    fun get_amount_for_add_liquidity<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: u64, arg2: u64, arg3: u64, arg4: u64) : (u64, u64) {
        abort 0
    }
    
    fun get_fee_from_protocol_configs(arg0: &ProtocolConfigs, arg1: bool) : (u64, u64) {
        abort 0
    }
    
    public fun get_reserves<T0, T1>(arg0: &Pool<T0, T1>) : (u64, u64, u64) {
        abort 0
    }
    
    fun get_scale_from_coinmetadata<T0>(arg0: &0x2::coin::CoinMetadata<T0>) : u64 {
        abort 0
    }
    
    fun get_token_amount_to_maintain_ratio(arg0: u64, arg1: u64, arg2: u64) : u64 {
        abort 0
    }
    
    fun init(arg0: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    fun mint_lsp_token<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: 0x2::balance::Balance<T0>, arg2: 0x2::balance::Balance<T1>, arg3: &mut 0x2::tx_context::TxContext) : 0x2::coin::Coin<LSP<T0, T1>> {
        abort 0
    }
    
    public fun remove_liquidity<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: KriyaLPToken<T0, T1>, arg2: u64, arg3: &mut 0x2::tx_context::TxContext) : (0x2::coin::Coin<T1>, 0x2::coin::Coin<T0>) {
        abort 0
    }
    
    public entry fun remove_liquidity_<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: KriyaLPToken<T0, T1>, arg2: u64, arg3: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public entry fun remove_whitelisted_address_config(arg0: &mut ProtocolConfigs, arg1: address, arg2: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public entry fun set_pause_config(arg0: &mut ProtocolConfigs, arg1: bool, arg2: bool, arg3: bool, arg4: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public entry fun set_stable_fee_config(arg0: &mut ProtocolConfigs, arg1: u64, arg2: u64, arg3: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public entry fun set_uc_fee_config(arg0: &mut ProtocolConfigs, arg1: u64, arg2: u64, arg3: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public entry fun set_whitelisted_address_config(arg0: &mut ProtocolConfigs, arg1: address, arg2: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun swap_token_x<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: 0x2::coin::Coin<T0>, arg2: u64, arg3: u64, arg4: &mut 0x2::tx_context::TxContext) : 0x2::coin::Coin<T1> {
        abort 0
    }
    
    public entry fun swap_token_x_<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: 0x2::coin::Coin<T0>, arg2: u64, arg3: u64, arg4: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun swap_token_y<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: 0x2::coin::Coin<T1>, arg2: u64, arg3: u64, arg4: &mut 0x2::tx_context::TxContext) : 0x2::coin::Coin<T0> {
        abort 0
    }
    
    public entry fun swap_token_y_<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: 0x2::coin::Coin<T1>, arg2: u64, arg3: u64, arg4: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public entry fun update_fees<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: &ProtocolConfigs, arg2: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public entry fun update_pool<T0, T1>(arg0: &mut Pool<T0, T1>, arg1: &ProtocolConfigs, arg2: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    // decompiled from Move bytecode v6
}

