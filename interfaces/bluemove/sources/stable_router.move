module bluemove::stable_router {
    public entry fun remove_liquidity<T0, T1>(arg0: 0x2::coin::Coin<0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::stable_swap::LSP<T0, T1>>, arg1: u64, arg2: u64, arg3: u64, arg4: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::stable_swap::Dex_Stable_Info, arg5: &0x2::clock::Clock, arg6: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public entry fun add_stable_liquidity<T0, T1>(arg0: 0x2::coin::Coin<T0>, arg1: u64, arg2: u64, arg3: 0x2::coin::Coin<T1>, arg4: u64, arg5: u64, arg6: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::stable_swap::Dex_Stable_Info, arg7: &0x2::clock::Clock, arg8: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public entry fun create_stable_pool<T0, T1>(arg0: 0x2::coin::Coin<T0>, arg1: u64, arg2: 0x2::coin::Coin<T1>, arg3: u64, arg4: u8, arg5: u8, arg6: u64, arg7: u64, arg8: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::stable_swap::Dex_Stable_Info, arg9: &0x2::clock::Clock, arg10: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public entry fun swap_exact_input<T0, T1>(arg0: 0x2::coin::Coin<T0>, arg1: u64, arg2: u64, arg3: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::stable_swap::Dex_Stable_Info, arg4: &0x2::clock::Clock, arg5: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun swap_exact_input_<T0, T1>(arg0: 0x2::coin::Coin<T0>, arg1: u64, arg2: u64, arg3: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::stable_swap::Dex_Stable_Info, arg4: &0x2::clock::Clock, arg5: &mut 0x2::tx_context::TxContext) : 0x2::coin::Coin<T1> {
        abort 0
    }
    
    public entry fun swap_exact_output<T0, T1>(arg0: 0x2::coin::Coin<T0>, arg1: u64, arg2: u64, arg3: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::stable_swap::Dex_Stable_Info, arg4: &0x2::clock::Clock, arg5: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun swap_exact_output_<T0, T1>(arg0: 0x2::coin::Coin<T0>, arg1: u64, arg2: u64, arg3: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::stable_swap::Dex_Stable_Info, arg4: &0x2::clock::Clock, arg5: &mut 0x2::tx_context::TxContext) : 0x2::coin::Coin<T1> {
        abort 0
    }
    
    // decompiled from Move bytecode v6
}

