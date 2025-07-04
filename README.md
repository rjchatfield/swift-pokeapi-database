# PokeAPI Database for Swift

A local SQLite version of the [PokeAPI](https://pokeapi.co) database for Swift applications, built using [StructuredQueries](https://github.com/pointfreeco/swift-structured-queries) and [GRDB.swift](https://github.com/groue/GRDB.swift) for type-safe database access.

## Overview

This package provides a complete, offline-accessible Pokemon database with all the data from PokeAPI packaged as a Swift library. Perfect for iOS and macOS apps that need Pokemon data without network dependencies.

## Features

- 🗄️ Complete PokeAPI database in SQLite format
- 🔍 Type-safe database queries using StructuredQueries
- 📱 iOS 18+ and macOS 15+ support
- ⚡ Fast, offline access to Pokemon data
- 🧪 Comprehensive test suite with snapshot testing

## Requirements

- iOS 13.0+, macOS 10.15+, tvOS 13+, watchOS 7.0+
- Swift 6.1+
- Xcode 16.4+

## Installation

### Swift Package Manager

Add this package to your project by adding the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/rjchatfield/swift-pokeapi-database", from: "0.1.0")
]
```

And then adding the following product to any target that needs access to the library:

```swift
.product(name: "PokeAPIDatabase", package: "swift-pokeapi-database"),
```

Or add it through Xcode:
1. File → Add Package Dependencies
2. Enter the repository URL
3. Select the version you want to use

## Available Models

The package includes complete models for all PokeAPI entities:

- `PokeAPIPokemon` - Individual Pokemon forms
- `PokeAPIPokemonSpecies` - Base Pokemon species data
- `PokeAPIType` - Pokemon types (Fire, Water, etc.)
- `PokeAPIMove` - Pokemon moves
- `PokeAPIAbility` - Pokemon abilities
- `PokeAPIItem` - Items and berries
- `PokeAPILocation` - Game locations
- And many more...

## Building and Testing

```bash
# Build the package
swift build

# Run tests
swift test
```

## Updating the Database

To update the SQLite database with the latest Pokemon data from the PokeAPI CSV files:

```bash
# Update database with latest CSV data
./scripts/update_database.sh
```

**Prerequisites:**
- `sqlite3` (usually pre-installed on macOS/Linux)
- `csvs-to-sqlite` - install with `pip install csvs-to-sqlite`

## Data Attribution

This package contains data from the [PokeAPI](https://pokeapi.co) project. All Pokemon data is sourced from PokeAPI's comprehensive database.

**Important:** Pokemon and Pokemon character names are trademarks of Nintendo. This package is not affiliated with or endorsed by Nintendo, Game Freak, or The Pokemon Company.

## Contributing

We welcome contributions! Here's how you can help:

### Reporting Issues

- Check existing issues before creating a new one
- Include Swift version, platform, and clear reproduction steps
- For database issues, specify which Pokemon/data is affected

### Code Contributions

- Follow existing code style and patterns
- Add tests for new functionality
- Ensure all tests pass with `swift test`
- Update documentation as needed

### Data Issues

**Note:** The Pokemon data comes directly from PokeAPI. If you find incorrect Pokemon data (stats, types, etc.), please report it to the [PokeAPI project](https://github.com/PokeAPI/pokeapi) instead.

For issues with the Swift models or database schema, please create an issue here.

## License

This project is licensed under the BSD 3-Clause License - see the [LICENSE](LICENSE) file for details.

The Pokemon data is provided by PokeAPI under their license terms. Pokemon and Pokemon character names are trademarks of Nintendo.
