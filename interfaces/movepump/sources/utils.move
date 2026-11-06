module movepump::utils {
    struct U256 has copy, drop, store {
        v0: u64,
        v1: u64,
        v2: u64,
        v3: u64,
    }
    
    struct DU256 has copy, drop, store {
        v0: u64,
        v1: u64,
        v2: u64,
        v3: u64,
        v4: u64,
        v5: u64,
        v6: u64,
        v7: u64,
    }
    
    public fun to_bytes(arg0: &U256) : vector<u8> {
        let v0 = 0x1::vector::empty<u8>();
        let v1 = get(arg0, 0);
        0x1::vector::append<u8>(&mut v0, 0x1::bcs::to_bytes<u64>(&v1));
        let v2 = get(arg0, 1);
        0x1::vector::append<u8>(&mut v0, 0x1::bcs::to_bytes<u64>(&v2));
        let v3 = get(arg0, 2);
        0x1::vector::append<u8>(&mut v0, 0x1::bcs::to_bytes<u64>(&v3));
        let v4 = get(arg0, 3);
        0x1::vector::append<u8>(&mut v0, 0x1::bcs::to_bytes<u64>(&v4));
        v0
    }
    
    public fun add(arg0: U256, arg1: U256) : U256 {
        let v0 = zero();
        let v1 = 0;
        let v2 = 0;
        while (v2 < 4) {
            let v3 = get(&arg0, v2);
            let v4 = get(&arg1, v2);
            if (v1 != 0) {
                let (v5, v6) = overflowing_add(v3, v4);
                let (v7, v8) = overflowing_add(v5, v1);
                put(&mut v0, v2, v7);
                let v9 = 0;
                v1 = v9;
                if (v6) {
                    v1 = v9 + 1;
                };
                if (v8) {
                    v1 = v1 + 1;
                };
            } else {
                let (v10, v11) = overflowing_add(v3, v4);
                put(&mut v0, v2, v10);
                v1 = 0;
                if (v11) {
                    v1 = 1;
                };
            };
            v2 = v2 + 1;
        };
        assert!(v1 == 0, 2);
        v0
    }
    
    public fun and(arg0: &U256, arg1: &U256) : U256 {
        let v0 = zero();
        let v1 = 0;
        while (v1 < 4) {
            put(&mut v0, v1, get(arg0, v1) & get(arg1, v1));
            v1 = v1 + 1;
        };
        v0
    }
    
    public fun as_u128(arg0: U256) : u128 {
        assert!(arg0.v2 == 0 && arg0.v3 == 0, 0);
        ((arg0.v1 as u128) << 64) + (arg0.v0 as u128)
    }
    
    public fun as_u64(arg0: U256) : u64 {
        assert!(arg0.v1 == 0 && arg0.v2 == 0 && arg0.v3 == 0, 0);
        arg0.v0
    }
    
    fun bits(arg0: &U256) : u64 {
        let v0 = 1;
        while (v0 < 4) {
            let v1 = get(arg0, 4 - v0);
            if (v1 > 0) {
                return 64 * (4 - v0 + 1) - (leading_zeros_u64(v1) as u64)
            };
            v0 = v0 + 1;
        };
        64 - (leading_zeros_u64(get(arg0, 0)) as u64)
    }
    
    public fun compare(arg0: &U256, arg1: &U256) : u8 {
        let v0 = 4;
        while (v0 > 0) {
            let v1 = v0 - 1;
            v0 = v1;
            let v2 = get(arg0, v1);
            let v3 = get(arg1, v1);
            if (v2 != v3) {
                if (v2 < v3) {
                    return 1
                };
                return 2
            };
        };
        0
    }
    
    public fun div(arg0: U256, arg1: U256) : U256 {
        let v0 = zero();
        let v1 = bits(&arg0);
        let v2 = bits(&arg1);
        assert!(v2 != 0, 3);
        if (v1 < v2) {
            return v0
        };
        let v3 = v1 - v2;
        let v4 = v3;
        arg1 = shl(arg1, (v3 as u8));
        loop {
            let v5 = compare(&arg0, &arg1);
            if (v5 == 2 || v5 == 0) {
                let v6 = v4 / 64;
                let v00 = get(&v0, v6);
                put(&mut v0, v6, v00 | 1 << ((v4 % 64) as u8));
                let v7 = arg1;
                arg0 = sub(arg0, v7);
            };
            arg1 = shr(arg1, 1);
            if (v4 == 0) {
                break
            };
            v4 = v4 - 1;
        };
        v0
    }
    
    fun du256_to_u256(arg0: DU256) : (U256, bool) {
        let v0 = U256{
            v0 : arg0.v0, 
            v1 : arg0.v1, 
            v2 : arg0.v2, 
            v3 : arg0.v3,
        };
        let v1 = false;
        if (arg0.v4 != 0 || arg0.v5 != 0 || arg0.v6 != 0 || arg0.v7 != 0) {
            v1 = true;
        };
        (v0, v1)
    }
    
    public fun from_bytes(arg0: &vector<u8>) : U256 {
        assert!(0x1::vector::length<u8>(arg0) == 32, 4);
        let v0 = zero();
        put(&mut v0, 0, ((*0x1::vector::borrow<u8>(arg0, 0) as u64) << 7) + ((*0x1::vector::borrow<u8>(arg0, 1) as u64) << 6) + ((*0x1::vector::borrow<u8>(arg0, 2) as u64) << 5) + ((*0x1::vector::borrow<u8>(arg0, 3) as u64) << 4) + ((*0x1::vector::borrow<u8>(arg0, 4) as u64) << 3) + ((*0x1::vector::borrow<u8>(arg0, 5) as u64) << 2) + ((*0x1::vector::borrow<u8>(arg0, 6) as u64) << 1) + (*0x1::vector::borrow<u8>(arg0, 7) as u64));
        put(&mut v0, 1, ((*0x1::vector::borrow<u8>(arg0, 8) as u64) << 7) + ((*0x1::vector::borrow<u8>(arg0, 9) as u64) << 6) + ((*0x1::vector::borrow<u8>(arg0, 10) as u64) << 5) + ((*0x1::vector::borrow<u8>(arg0, 11) as u64) << 4) + ((*0x1::vector::borrow<u8>(arg0, 12) as u64) << 3) + ((*0x1::vector::borrow<u8>(arg0, 13) as u64) << 2) + ((*0x1::vector::borrow<u8>(arg0, 14) as u64) << 1) + (*0x1::vector::borrow<u8>(arg0, 15) as u64));
        put(&mut v0, 2, ((*0x1::vector::borrow<u8>(arg0, 16) as u64) << 7) + ((*0x1::vector::borrow<u8>(arg0, 17) as u64) << 6) + ((*0x1::vector::borrow<u8>(arg0, 18) as u64) << 5) + ((*0x1::vector::borrow<u8>(arg0, 19) as u64) << 4) + ((*0x1::vector::borrow<u8>(arg0, 20) as u64) << 3) + ((*0x1::vector::borrow<u8>(arg0, 21) as u64) << 2) + ((*0x1::vector::borrow<u8>(arg0, 22) as u64) << 1) + (*0x1::vector::borrow<u8>(arg0, 23) as u64));
        put(&mut v0, 3, ((*0x1::vector::borrow<u8>(arg0, 24) as u64) << 7) + ((*0x1::vector::borrow<u8>(arg0, 25) as u64) << 6) + ((*0x1::vector::borrow<u8>(arg0, 26) as u64) << 5) + ((*0x1::vector::borrow<u8>(arg0, 27) as u64) << 4) + ((*0x1::vector::borrow<u8>(arg0, 28) as u64) << 3) + ((*0x1::vector::borrow<u8>(arg0, 29) as u64) << 2) + ((*0x1::vector::borrow<u8>(arg0, 30) as u64) << 1) + (*0x1::vector::borrow<u8>(arg0, 31) as u64));
        v0
    }
    
    public fun from_u128(arg0: u128) : U256 {
        let (v0, v1) = split_u128(arg0);
        U256{
            v0 : v1, 
            v1 : v0, 
            v2 : 0, 
            v3 : 0,
        }
    }
    
    public fun from_u64(arg0: u64) : U256 {
        from_u128((arg0 as u128))
    }
    
    public fun get(arg0: &U256, arg1: u64) : u64 {
        if (arg1 == 0) {
            arg0.v0
        } else {
            let v1 = if (arg1 == 1) {
                arg0.v1
            } else {
                let v2 = if (arg1 == 2) {
                    arg0.v2
                } else {
                    assert!(arg1 == 3, 1);
                    arg0.v3
                };
                v2
            };
            v1
        }
    }
    
    fun get_d(arg0: &DU256, arg1: u64) : u64 {
        if (arg1 == 0) {
            arg0.v0
        } else {
            let v1 = if (arg1 == 1) {
                arg0.v1
            } else {
                let v2 = if (arg1 == 2) {
                    arg0.v2
                } else {
                    let v3 = if (arg1 == 3) {
                        arg0.v3
                    } else {
                        let v4 = if (arg1 == 4) {
                            arg0.v4
                        } else {
                            let v5 = if (arg1 == 5) {
                                arg0.v5
                            } else {
                                let v6 = if (arg1 == 6) {
                                    arg0.v6
                                } else {
                                    assert!(arg1 == 7, 1);
                                    arg0.v7
                                };
                                v6
                            };
                            v5
                        };
                        v4
                    };
                    v3
                };
                v2
            };
            v1
        }
    }
    
    public fun get_equal() : u8 {
        0
    }
    
    public fun get_greater_than() : u8 {
        2
    }
    
    public fun get_less_than() : u8 {
        1
    }
    
    fun leading_zeros_u64(arg0: u64) : u8 {
        if (arg0 == 0) {
            return 64
        };
        if (arg0 >> 32 == 0) {
            let v1 = 32;
            while (v1 >= 1) {
                if ((arg0 & 4294967295) >> v1 - 1 & 1 != 0) {
                    break
                };
                v1 = v1 - 1;
            };
            32 - v1 + 32
        } else {
            let v2 = 64;
            while (v2 >= 1) {
                if (arg0 >> v2 - 1 & 1 != 0) {
                    break
                };
                v2 = v2 - 1;
            };
            64 - v2
        }
    }
    
    public fun mul(arg0: U256, arg1: U256) : U256 {
        let v0 = DU256{
            v0 : 0, 
            v1 : 0, 
            v2 : 0, 
            v3 : 0, 
            v4 : 0, 
            v5 : 0, 
            v6 : 0, 
            v7 : 0,
        };
        let v1 = 0;
        while (v1 < 4) {
            let v2 = 0;
            let v3 = get(&arg1, v1);
            let v4 = 0;
            while (v4 < 4) {
                let v5 = get(&arg0, v4);
                if (v5 != 0 || v2 != 0) {
                    let (v6, v7) = split_u128((v5 as u128) * (v3 as u128));
                    let (v8, v9) = overflowing_add(v7, get_d(&v0, v1 + v4));
                    put_d(&mut v0, v1 + v4, v8);
                    let v10 = if (v9) {
                        1
                    } else {
                        0
                    };
                    let (v11, v12) = overflowing_add(v6 + v10, v2);
                    let (v13, v14) = overflowing_add(v11, get_d(&v0, v1 + v4 + 1));
                    put_d(&mut v0, v1 + v4 + 1, v13);
                    let v15 = if (v12 || v14) {
                        1
                    } else {
                        0
                    };
                    v2 = v15;
                };
                v4 = v4 + 1;
            };
            v1 = v1 + 1;
        };
        let (v16, v17) = du256_to_u256(v0);
        assert!(!v17, 2);
        v16
    }
    
    public fun or(arg0: &U256, arg1: &U256) : U256 {
        let v0 = zero();
        let v1 = 0;
        while (v1 < 4) {
            put(&mut v0, v1, get(arg0, v1) | get(arg1, v1));
            v1 = v1 + 1;
        };
        v0
    }
    
    fun overflowing_add(arg0: u64, arg1: u64) : (u64, bool) {
        let v0 = (arg0 as u128);
        let v1 = (arg1 as u128);
        let v2 = v0 + v1;
        if (v2 > 18446744073709551615) {
            (((v2 - 18446744073709551615 - 1) as u64), true)
        } else {
            (((v0 + v1) as u64), false)
        }
    }
    
    fun overflowing_sub(arg0: u64, arg1: u64) : (u64, bool) {
        if (arg0 < arg1) {
            ((18446744073709551615 as u64) - arg1 - arg0 + 1, true)
        } else {
            (arg0 - arg1, false)
        }
    }
    
    fun put(arg0: &mut U256, arg1: u64, arg2: u64) {
        if (arg1 == 0) {
            arg0.v0 = arg2;
        } else {
            if (arg1 == 1) {
                arg0.v1 = arg2;
            } else {
                if (arg1 == 2) {
                    arg0.v2 = arg2;
                } else {
                    assert!(arg1 == 3, 1);
                    arg0.v3 = arg2;
                };
            };
        };
    }
    
    fun put_d(arg0: &mut DU256, arg1: u64, arg2: u64) {
        if (arg1 == 0) {
            arg0.v0 = arg2;
        } else {
            if (arg1 == 1) {
                arg0.v1 = arg2;
            } else {
                if (arg1 == 2) {
                    arg0.v2 = arg2;
                } else {
                    if (arg1 == 3) {
                        arg0.v3 = arg2;
                    } else {
                        if (arg1 == 4) {
                            arg0.v4 = arg2;
                        } else {
                            if (arg1 == 5) {
                                arg0.v5 = arg2;
                            } else {
                                if (arg1 == 6) {
                                    arg0.v6 = arg2;
                                } else {
                                    assert!(arg1 == 7, 1);
                                    arg0.v7 = arg2;
                                };
                            };
                        };
                    };
                };
            };
        };
    }
    
    public fun shl(arg0: U256, arg1: u8) : U256 {
        let v0 = zero();
        let v1 = (arg1 as u64) / 64;
        let v2 = (arg1 as u64) % 64;
        let v3 = v1;
        while (v3 < 4) {
            put(&mut v0, v3, get(&arg0, v3 - v1) << (v2 as u8));
            v3 = v3 + 1;
        };
        if (v2 > 0) {
            let v4 = v1 + 1;
            while (v4 < 4) {
                let v00 = get(&v0, v4);
                put(&mut v0, v4, v00 + (get(&arg0, v4 - 1 - v1) >> 64 - (v2 as u8)));
                v4 = v4 + 1;
            };
        };
        v0
    }
    
    public fun shr(arg0: U256, arg1: u8) : U256 {
        let v0 = zero();
        let v1 = (arg1 as u64) / 64;
        let v2 = (arg1 as u64) % 64;
        let v3 = v1;
        while (v3 < 4) {
            put(&mut v0, v3 - v1, get(&arg0, v3) >> (v2 as u8));
            v3 = v3 + 1;
        };
        if (v2 > 0) {
            let v4 = v1 + 1;
            while (v4 < 4) {
                let v00 = get(&v0, v4 - v1 - 1);
                put(&mut v0, v4 - v1 - 1, v00 + (get(&arg0, v4) << 64 - (v2 as u8)));
                v4 = v4 + 1;
            };
        };
        v0
    }
    
    fun split_u128(arg0: u128) : (u64, u64) {
        (((arg0 >> 64) as u64), ((arg0 & 18446744073709551615) as u64))
    }
    
    public fun sub(arg0: U256, arg1: U256) : U256 {
        let v0 = zero();
        let v1 = 0;
        let v2 = 0;
        while (v2 < 4) {
            let v3 = get(&arg0, v2);
            let v4 = get(&arg1, v2);
            if (v1 != 0) {
                let (v5, v6) = overflowing_sub(v3, v4);
                let (v7, v8) = overflowing_sub(v5, v1);
                put(&mut v0, v2, v7);
                let v9 = 0;
                v1 = v9;
                if (v6) {
                    v1 = v9 + 1;
                };
                if (v8) {
                    v1 = v1 + 1;
                };
            } else {
                let (v10, v11) = overflowing_sub(v3, v4);
                put(&mut v0, v2, v10);
                v1 = 0;
                if (v11) {
                    v1 = 1;
                };
            };
            v2 = v2 + 1;
        };
        assert!(v1 == 0, 2);
        v0
    }
    
    public fun xor(arg0: &U256, arg1: &U256) : U256 {
        let v0 = zero();
        let v1 = 0;
        while (v1 < 4) {
            put(&mut v0, v1, get(arg0, v1) ^ get(arg1, v1));
            v1 = v1 + 1;
        };
        v0
    }
    
    public fun zero() : U256 {
        U256{
            v0 : 0, 
            v1 : 0, 
            v2 : 0, 
            v3 : 0,
        }
    }
    
    // decompiled from Move bytecode v6
}

