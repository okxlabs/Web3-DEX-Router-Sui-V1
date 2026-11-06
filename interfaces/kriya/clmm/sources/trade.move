module kriya_clmm::trade {
    struct FlashSwapReceipt {
        pool_id: 0x2::object::ID,
        amount_x_debt: u64,
        amount_y_debt: u64,
    }
    
    struct FlashLoanReceipt {
        pool_id: 0x2::object::ID,
        amount_x: u64,
        amount_y: u64,
        fee_x: u64,
        fee_y: u64,
    }
    
    struct SwapState has copy, drop {
        amount_specified_remaining: u64,
        amount_calculated: u64,
        sqrt_price: u128,
        tick_index: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32,
        fee_growth_global: u128,
        protocol_fee: u64,
        liquidity: u128,
        fee_amount: u64,
    }
    
    struct SwapStepComputations has copy, drop {
        sqrt_price_start: u128,
        tick_index_next: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32,
        initialized: bool,
        sqrt_price_next: u128,
        amount_in: u64,
        amount_out: u64,
        fee_amount: u64,
    }
    
    struct SwapEvent has copy, drop, store {
        sender: address,
        pool_id: 0x2::object::ID,
        x_for_y: bool,
        amount_x: u64,
        amount_y: u64,
        sqrt_price_before: u128,
        sqrt_price_after: u128,
        liquidity: u128,
        tick_index: 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32,
        fee_amount: u64,
        protocol_fee: u64,
        reserve_x: u64,
        reserve_y: u64,
    }
    
    struct RepayFlashLoanEvent has copy, drop, store {
        sender: address,
        pool_id: 0x2::object::ID,
        amount_x_debt: u64,
        amount_y_debt: u64,
        actual_fee_paid_x: u64,
        actual_fee_paid_y: u64,
        reserve_x: u64,
        reserve_y: u64,
        fee_x: u64,
        fee_y: u64,
    }
    
    struct RepayFlashSwapEvent has copy, drop, store {
        sender: address,
        pool_id: 0x2::object::ID,
        amount_x_debt: u64,
        amount_y_debt: u64,
        paid_x: u64,
        paid_y: u64,
        reserve_x: u64,
        reserve_y: u64,
    }
    
    struct FlashLoanEvent has copy, drop, store {
        sender: address,
        pool_id: 0x2::object::ID,
        amount_x: u64,
        amount_y: u64,
        reserve_x: u64,
        reserve_y: u64,
    }
    
    fun closer(arg0: u128, arg1: u128, arg2: u128) : bool {
        abort 0
    }
    
    public fun compute_swap_result<T0, T1>(arg0: &0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::pool::Pool<T0, T1>, arg1: bool, arg2: bool, arg3: u128, arg4: u64) : SwapState {
        abort 0
    }
    
    public fun compute_swap_result_max<T0, T1>(arg0: &0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::pool::Pool<T0, T1>, arg1: bool, arg2: bool, arg3: u128) : SwapState {
        abort 0
    }
    
    public fun flash_loan<T0, T1>(arg0: &mut 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::pool::Pool<T0, T1>, arg1: u64, arg2: u64, arg3: &0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::version::Version, arg4: &0x2::tx_context::TxContext) : (0x2::balance::Balance<T0>, 0x2::balance::Balance<T1>, FlashLoanReceipt) {
        abort 0
    }
    
    public fun flash_receipt_debts(arg0: &FlashLoanReceipt) : (u64, u64) {
        abort 0
    }
    
    public fun flash_swap<T0, T1>(arg0: &mut 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::pool::Pool<T0, T1>, arg1: bool, arg2: bool, arg3: u64, arg4: u128, arg5: &0x2::clock::Clock, arg6: &0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::version::Version, arg7: &0x2::tx_context::TxContext) : (0x2::balance::Balance<T0>, 0x2::balance::Balance<T1>, FlashSwapReceipt) {
        abort 0
    }
    
    public fun get_optimal_swap_amount_for_single_sided_liquidity<T0, T1>(arg0: &0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::pool::Pool<T0, T1>, arg1: u64, arg2: &0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::position::Position, arg3: u128, arg4: bool, arg5: u64) : (u64, bool) {
        abort 0
    }
    
    public fun get_state_amount_calculated(arg0: &SwapState) : u64 {
        abort 0
    }
    
    public fun get_state_amount_specified(arg0: &SwapState) : u64 {
        abort 0
    }
    
    public fun get_state_fee_amount(arg0: &SwapState) : u64 {
        abort 0
    }
    
    public fun get_state_fee_growth_global(arg0: &SwapState) : u128 {
        abort 0
    }
    
    public fun get_state_liquidity(arg0: &SwapState) : u128 {
        abort 0
    }
    
    public fun get_state_protocol_fee(arg0: &SwapState) : u64 {
        abort 0
    }
    
    public fun get_state_sqrt_price(arg0: &SwapState) : u128 {
        abort 0
    }
    
    public fun get_state_tick_index(arg0: &SwapState) : 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32 {
        abort 0
    }
    
    public fun get_step_amount_in(arg0: &SwapStepComputations) : u64 {
        abort 0
    }
    
    public fun get_step_amount_out(arg0: &SwapStepComputations) : u64 {
        abort 0
    }
    
    public fun get_step_fee_amount(arg0: &SwapStepComputations) : u64 {
        abort 0
    }
    
    public fun get_step_initialized(arg0: &SwapStepComputations) : bool {
        abort 0
    }
    
    public fun get_step_sqrt_price_next(arg0: &SwapStepComputations) : u128 {
        abort 0
    }
    
    public fun get_step_sqrt_price_start(arg0: &SwapStepComputations) : u128 {
        abort 0
    }
    
    public fun get_step_tick_index_next(arg0: &SwapStepComputations) : 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::i32::I32 {
        abort 0
    }
    
    public fun repay_flash_loan<T0, T1>(arg0: &mut 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::pool::Pool<T0, T1>, arg1: FlashLoanReceipt, arg2: 0x2::balance::Balance<T0>, arg3: 0x2::balance::Balance<T1>, arg4: &0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::version::Version, arg5: &0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun repay_flash_swap<T0, T1>(arg0: &mut 0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::pool::Pool<T0, T1>, arg1: FlashSwapReceipt, arg2: 0x2::balance::Balance<T0>, arg3: 0x2::balance::Balance<T1>, arg4: &0xf6c05e2d9301e6e91dc6ab6c3ca918f7d55896e1f1edd64adc0e615cde27ebf1::version::Version, arg5: &0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun swap_receipt_debts(arg0: &FlashSwapReceipt) : (u64, u64) {
        abort 0
    }
    
    // decompiled from Move bytecode v6
}

