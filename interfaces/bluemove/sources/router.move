module bluemove::router {
   
    
    public entry fun swap_exact_input<T0, T1>(
        arg0: u64, //input amount
        arg1: 0x2::coin::Coin<T0>, //input coin
        arg2: u64, //min return 
        arg3: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, //huoqu pool
        arg4: &mut 0x2::tx_context::TxContext //ctx
    ) {
        abort 0
    }
    
    public fun swap_exact_input_<T0, T1>(arg0: u64, arg1: 0x2::coin::Coin<T0>, arg2: u64, arg3: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, arg4: &mut 0x2::tx_context::TxContext) : 0x2::coin::Coin<T1> {
        abort 0
    }
    
    fun swap_exact_input_double_internal<T0, T1, T2>(arg0: bool, arg1: bool, arg2: u64, arg3: 0x2::coin::Coin<T0>, arg4: u64, arg5: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, arg6: &mut 0x2::tx_context::TxContext) : (u64, 0x2::coin::Coin<T2>) {
        abort 0
    }
    
    public entry fun swap_exact_input_doublehop<T0, T1, T2>(arg0: u64, arg1: 0x2::coin::Coin<T0>, arg2: u64, arg3: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, arg4: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun swap_exact_input_doublehop_<T0, T1, T2>(arg0: u64, arg1: 0x2::coin::Coin<T0>, arg2: u64, arg3: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, arg4: &mut 0x2::tx_context::TxContext) : 0x2::coin::Coin<T2> {
        abort 0
    }
    
    fun swap_exact_input_quadruple_internal<T0, T1, T2, T3, T4>(arg0: bool, arg1: bool, arg2: bool, arg3: bool, arg4: u64, arg5: 0x2::coin::Coin<T0>, arg6: u64, arg7: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, arg8: &mut 0x2::tx_context::TxContext) : (u64, 0x2::coin::Coin<T4>) {
        abort 0
    }
    
    public entry fun swap_exact_input_quadruplehop<T0, T1, T2, T3, T4>(arg0: u64, arg1: 0x2::coin::Coin<T0>, arg2: u64, arg3: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, arg4: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun swap_exact_input_quadruplehop_<T0, T1, T2, T3, T4>(arg0: u64, arg1: 0x2::coin::Coin<T0>, arg2: u64, arg3: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, arg4: &mut 0x2::tx_context::TxContext) : 0x2::coin::Coin<T4> {
        abort 0
    }
    
    fun swap_exact_input_triple_internal<T0, T1, T2, T3>(arg0: bool, arg1: bool, arg2: bool, arg3: u64, arg4: 0x2::coin::Coin<T0>, arg5: u64, arg6: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, arg7: &mut 0x2::tx_context::TxContext) : (u64, 0x2::coin::Coin<T3>) {
        abort 0
    }
    
    public entry fun swap_exact_input_triplehop<T0, T1, T2, T3>(arg0: u64, arg1: 0x2::coin::Coin<T0>, arg2: u64, arg3: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, arg4: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun swap_exact_input_triplehop_<T0, T1, T2, T3>(arg0: u64, arg1: 0x2::coin::Coin<T0>, arg2: u64, arg3: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, arg4: &mut 0x2::tx_context::TxContext) : 0x2::coin::Coin<T3> {
        abort 0
    }
    
    public entry fun swap_exact_output<T0, T1>(arg0: u64, arg1: u64, arg2: 0x2::coin::Coin<T0>, arg3: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, arg4: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun swap_exact_output_<T0, T1>(arg0: u64, arg1: u64, arg2: 0x2::coin::Coin<T0>, arg3: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, arg4: &mut 0x2::tx_context::TxContext) : 0x2::coin::Coin<T1> {
        abort 0
    }
    
    fun swap_exact_output_double_internal<T0, T1, T2>(arg0: bool, arg1: bool, arg2: u64, arg3: 0x2::coin::Coin<T0>, arg4: u64, arg5: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, arg6: &mut 0x2::tx_context::TxContext) : (u64, 0x2::coin::Coin<T2>) {
        abort 0
    }
    
    public entry fun swap_exact_output_doublehop<T0, T1, T2>(arg0: u64, arg1: u64, arg2: 0x2::coin::Coin<T0>, arg3: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, arg4: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun swap_exact_output_doublehop_<T0, T1, T2>(arg0: u64, arg1: u64, arg2: 0x2::coin::Coin<T0>, arg3: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, arg4: &mut 0x2::tx_context::TxContext) : 0x2::coin::Coin<T2> {
        abort 0
    }
    
    fun swap_exact_output_quadruple_internal<T0, T1, T2, T3, T4>(arg0: bool, arg1: bool, arg2: bool, arg3: bool, arg4: u64, arg5: 0x2::coin::Coin<T0>, arg6: u64, arg7: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, arg8: &mut 0x2::tx_context::TxContext) : (u64, 0x2::coin::Coin<T4>) {
        abort 0
    }
    
    public fun swap_exact_output_quadruplehop<T0, T1, T2, T3, T4>(arg0: u64, arg1: u64, arg2: 0x2::coin::Coin<T0>, arg3: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, arg4: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun swap_exact_output_quadruplehop_<T0, T1, T2, T3, T4>(arg0: u64, arg1: u64, arg2: 0x2::coin::Coin<T0>, arg3: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, arg4: &mut 0x2::tx_context::TxContext) : 0x2::coin::Coin<T4> {
        abort 0
    }
    
    fun swap_exact_output_triple_internal<T0, T1, T2, T3>(arg0: bool, arg1: bool, arg2: bool, arg3: u64, arg4: 0x2::coin::Coin<T0>, arg5: u64, arg6: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, arg7: &mut 0x2::tx_context::TxContext) : (u64, 0x2::coin::Coin<T3>) {
        abort 0
    }
    
    public entry fun swap_exact_output_triplehop<T0, T1, T2, T3>(arg0: u64, arg1: u64, arg2: 0x2::coin::Coin<T0>, arg3: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, arg4: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun swap_exact_output_triplehop_<T0, T1, T2, T3>(arg0: u64, arg1: u64, arg2: 0x2::coin::Coin<T0>, arg3: &mut 0xb24b6789e088b876afabca733bed2299fbc9e2d6369be4d1acfa17d8145454d9::swap::Dex_Info, arg4: &mut 0x2::tx_context::TxContext) : 0x2::coin::Coin<T3> {
        abort 0
    }
    
    // decompiled from Move bytecode v6
}

