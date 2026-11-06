module kriya_clmm::app {
    struct AdminCap has store, key {
        id: 0x2::object::UID,
    }
    
    struct Acl has key {
        id: 0x2::object::UID,
    }
    
    public fun get_pool_admin(arg0: &Acl) : address {
        abort 0
    }
    
    public fun get_rewarder_admin(arg0: &Acl) : address {
        abort 0
    }
    
    fun init(arg0: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun set_pool_admin(arg0: &AdminCap, arg1: &mut Acl, arg2: address, arg3: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    public fun set_rewarder_admin(arg0: &AdminCap, arg1: &mut Acl, arg2: address, arg3: &mut 0x2::tx_context::TxContext) {
        abort 0
    }
    
    // decompiled from Move bytecode v6
}

