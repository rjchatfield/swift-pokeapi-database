import StructuredQueries
import Tagged

/// Represents all items in Pokemon games including healing items, Poke Balls,
/// evolution stones, held items, TMs, berries, and key items.
/// Items can be used in battle, held by Pokemon, or used in the overworld.
@Table("items")
public struct PokeAPIItem: Decodable, Hashable, Identifiable, Sendable {
    public typealias ID = Tagged<Self, Int>
    public typealias Identifier = String

    /// Unique item identifier
    @Column("id", primaryKey: true) public var id: ID
    
    /// Machine-readable item name (e.g., "potion", "poke-ball", "fire-stone")
    @Column("identifier") public var identifier: Identifier

    /// Item category (healing, pokeballs, evolution, held items, etc.)
    @Column("category_id") public var categoryId: PokeAPIItemCategory.ID

    /// Purchase cost in Poke Dollars (0 for items that can't be bought)
    /// Range: 0-100000
    @Column("cost") public var cost: Int
    
    /// Base power when used with the move Fling (Gen IV+)
    /// Nil for items that can't be flung
    /// Range: 10-130
    @Column("fling_power") public var flingPower: Int?
    
    /// Special effect when used with the move Fling
    /// Nil for items with no special fling effect
    @Column("fling_effect_id") public var flingEffectId: Int?

    // MARK: - Helpers

    public var localizedName: String {
        return PokeAPIStrings.item(id: id, identifier: identifier)
    }
}
