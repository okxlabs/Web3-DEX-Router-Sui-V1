module flowxv2::math {
    public fun max_u128(arg0: u128, arg1: u128) : u128 {
        if (arg0 > arg1) {
            arg0
        } else {
            arg1
        }
    }

    public fun max(arg0: u64, arg1: u64) : u64 {
        if (arg0 > arg1) {
            arg0
        } else {
            arg1
        }
    }

    public fun min(arg0: u64, arg1: u64) : u64 {
        if (arg0 < arg1) {
            arg0
        } else {
            arg1
        }
    }

    public fun min_u128(arg0: u128, arg1: u128) : u128 {
        if (arg0 < arg1) {
            arg0
        } else {
            arg1
        }
    }

    public fun pow(arg0: u64, arg1: u8) : u64 {
        abort 0
    }

    public fun sqrt(arg0: u64) : u64 {
        abort 0
    }

    public fun sqrt_u128(arg0: u128) : u128 {
        abort 0
    }

    // decompiled from Move bytecode v6
}
