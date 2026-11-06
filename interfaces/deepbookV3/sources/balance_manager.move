/// The BalanceManager is a shared object that holds all of the balances for different assets. A combination of `BalanceManager` and
/// `TradeProof` are passed into a pool to perform trades. A `TradeProof` can be generated in two ways: by the
/// owner directly, or by any `TradeCap` owner. The owner can generate a `TradeProof` without the risk of
/// equivocation. The `TradeCap` owner, due to it being an owned object, risks equivocation when generating
/// a `TradeProof`. Generally, a high frequency trading engine will trade as the default owner.
module deepbook::balance_manager {
    use std::type_name::TypeName;
    use sui::bag::Bag;
    use sui::balance::Balance;
    use sui::coin::Coin;
    use sui::vec_set::VecSet;
    use sui::object::{Self, ID, UID};

    // === Structs ===
    /// A shared object that is passed into pools for placing orders.
    public struct BalanceManager has key, store {
        id: UID,
        owner: address,
        balances: Bag,
        allow_listed: VecSet<ID>,
    }

    /// Owners of a `TradeCap` need to get a `TradeProof` to trade across pools in a single PTB (drops after).
    public struct TradeCap has key, store {
        id: UID,
        balance_manager_id: ID,
    }
}

