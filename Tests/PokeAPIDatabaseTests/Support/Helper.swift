import StructuredQueries
import StructuredQueriesSQLite
import StructuredQueriesTestSupport
@testable import PokeAPIDatabase

enum Helper {
    static func assertQuery<S: StructuredQueries.SelectStatement, each J: StructuredQueries.Table>(
        _ query: S,
        sql: (() -> String)? = nil,
        results: (() -> String)? = nil,
        fileID: StaticString = #fileID,
        filePath: StaticString = #filePath,
        function: StaticString = #function,
        line: UInt = #line,
        column: UInt = #column
    ) where S.QueryValue == (), S.Joins == (repeat each J) {
        StructuredQueriesTestSupport.assertQuery(
            query,
            execute: StructuredQueriesSQLite.Database.pokeAPI.execute,
            sql: sql,
            results: results,
            snapshotTrailingClosureOffset: 0,
            fileID: fileID,
            filePath: filePath,
            function: function,
            line: line,
            column: column
        )
    }
    
    static func assertQuery<each V: StructuredQueries.QueryRepresentable>(
        _ query: some StructuredQueries.Statement<(repeat each V)>,
        sql: (() -> String)? = nil,
        results: (() -> String)? = nil,
        fileID: StaticString = #fileID,
        filePath: StaticString = #filePath,
        function: StaticString = #function,
        line: UInt = #line,
        column: UInt = #column
    ) {
        StructuredQueriesTestSupport.assertQuery(
            query,
            execute: StructuredQueriesSQLite.Database.pokeAPI.execute,
            sql: sql,
            results: results,
            snapshotTrailingClosureOffset: 0,
            fileID: fileID,
            filePath: filePath,
            function: function,
            line: line,
            column: column
        )
    }
}

// MARK: -

extension StructuredQueriesSQLite.Database: @retroactive @unchecked Sendable {
    static var pokeAPI: StructuredQueriesSQLite.Database {
        return try! PokeAPIDatabase.makeSQLDatabase()
    }
}
