import XCTest

/// Asserts that an asynchronous expression is true.
///
/// - Parameters:
///   - expression: An asynchronous expression of Boolean type.
///   - message: An optional description of a failure.
///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
public func XCTAssertAsync(
    _ expression: @escaping @autoclosure () async throws -> Bool,
    _ message: @escaping @autoclosure () async -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    await _wrapSimpleCheck(
        assertion: XCTAssert,
        expression: expression,
        message: message,
        file: file,
        line: line
    )
}

/// Asserts that two values are equal.
///
/// - Parameters:
///   - expression1: An asynchronous expression of type `T`.
///   - expression2: An asynchronous expression of type `T`.
///   - message: An optional description of a failure.
///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
public func XCTAssertEqualAsync<T: Equatable>(
    _ expression1: @escaping @autoclosure () async throws -> T,
    _ expression2: @escaping @autoclosure () async throws -> T,
    _ message: @escaping @autoclosure () async -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    await _wrapComparisonCheck(
        assertion: XCTAssertEqual,
        expression1: expression1,
        expression2: expression2,
        message: message,
        file: file,
        line: line
    )
}

/// Asserts that two floating-point values are equal within a specified accuracy.
///
/// - Parameters:
///   - expression1: An asynchronous expression of type `T`.
///   - expression2: An asynchronous expression of type `T`.
///   - accuracy: An expression of type `T` describing the maximum difference between `expression1` and `expression2` for these values to be
///     considered equal.
///   - message: An optional description of a failure.
///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
public func XCTAssertEqualAsync<T: FloatingPoint>(
    _ expression1: @escaping @autoclosure () async throws -> T,
    _ expression2: @escaping @autoclosure () async throws -> T,
    accuracy: T,
    _ message: @escaping @autoclosure () async -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    await _wrapComparisonCheck(
        assertion: XCTAssertEqual,
        expression1: expression1,
        expression2: expression2,
        accuracy: accuracy,
        message: message,
        file: file,
        line: line
    )
}

/// Asserts that two numeric values are equal within a specified accuracy.
///
/// - Parameters:
///   - expression1: An asynchronous expression of type `T`.
///   - expression2: An asynchronous expression of type `T`.
///   - accuracy: An expression of type `T` describing the maximum difference between `expression1` and `expression2` for these values to be
///     considered equal.
///   - message: An optional description of a failure.
///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
public func XCTAssertEqualAsync<T: Numeric>(
    _ expression1: @escaping @autoclosure () async throws -> T,
    _ expression2: @escaping @autoclosure () async throws -> T,
    accuracy: T,
    _ message: @escaping @autoclosure () async -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    await _wrapComparisonCheck(
        assertion: XCTAssertEqual,
        expression1: expression1,
        expression2: expression2,
        accuracy: accuracy,
        message: message,
        file: file,
        line: line
    )
}

/// Asserts that an expression is false.
///
/// - Parameters:
///   - expression: An asynchronous expression of boolean type.
///   - message: An optional description of a failure.
///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
public func XCTAssertFalseAsync(
    _ expression: @escaping @autoclosure () async throws -> Bool,
    _ message: @escaping @autoclosure () async -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    await _wrapSimpleCheck(
        assertion: XCTAssertFalse,
        expression: expression,
        message: message,
        file: file,
        line: line
    )
}

/// Asserts that the value of the first expression is greater than the value of the second expression.
///
/// - Parameters:
///   - expression1: An asynchronous expression of type `T`.
///   - expression2: An asynchronous expression of type `T`.
///   - message: An optional description of a failure.
///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
public func XCTAssertGreaterThanAsync<T: Comparable>(
    _ expression1: @escaping @autoclosure () async throws -> T,
    _ expression2: @escaping @autoclosure () async throws -> T,
    _ message: @escaping @autoclosure () async -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    await _wrapComparisonCheck(
        assertion: XCTAssertGreaterThan,
        expression1: expression1,
        expression2: expression2,
        message: message,
        file: file,
        line: line
    )
}

/// Asserts that the value of the first expression is greater than or equal to the value of the second expression.
///
/// - Parameters:
///   - expression1: An asynchronous expression of type `T`.
///   - expression2: An asynchronous expression of type `T`.
///   - message: An optional description of a failure.
///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
public func XCTAssertGreaterThanOrEqualAsync<T: Comparable>(
    _ expression1: @escaping @autoclosure () async throws -> T,
    _ expression2: @escaping @autoclosure () async throws -> T,
    _ message: @escaping @autoclosure () async -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    await _wrapComparisonCheck(
        assertion: XCTAssertGreaterThanOrEqual,
        expression1: expression1,
        expression2: expression2,
        message: message,
        file: file,
        line: line
    )
}

/// Asserts that `expression1` is identical to (i.e. the same object instance as) `expression2`.
///
/// - Parameters:
///   - expression1: An asynchronous expression of object type.
///   - expression2: An asynchronous expression of object type.
///   - message: An optional description of a failure.
///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
public func XCTAssertIdenticalAsync(
    _ expression1: @escaping @autoclosure () async throws -> AnyObject?,
    _ expression2: @escaping @autoclosure () async throws -> AnyObject?,
    _ message: @escaping @autoclosure () async -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    await _wrapComparisonCheck(
        assertion: XCTAssertIdentical,
        expression1: expression1,
        expression2: expression2,
        message: message,
        file: file,
        line: line
    )
}

/// Asserts that the value of the first expression is less than the value of the second expression.
///
/// - Parameters:
///   - expression1: An asynchronous expression of type `T`.
///   - expression2: An asynchronous expression of type `T`.
///   - message: An optional description of a failure.
///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
public func XCTAssertLessThanAsync<T: Comparable>(
    _ expression1: @escaping @autoclosure () async throws -> T,
    _ expression2: @escaping @autoclosure () async throws -> T,
    _ message: @escaping @autoclosure () async -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    await _wrapComparisonCheck(
        assertion: XCTAssertLessThan,
        expression1: expression1,
        expression2: expression2,
        message: message,
        file: file,
        line: line
    )
}

/// Asserts that the value of the first expression is less than or equal to the value of the second expression.
///
/// - Parameters:
///   - expression1: An asynchronous expression of type `T`.
///   - expression2: An asynchronous expression of type `T`.
///   - message: An optional description of a failure.
///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
public func XCTAssertLessThanOrEqualAsync<T: Comparable>(
    _ expression1: @escaping @autoclosure () async throws -> T,
    _ expression2: @escaping @autoclosure () async throws -> T,
    _ message: @escaping @autoclosure () async -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    await _wrapComparisonCheck(
        assertion: XCTAssertLessThanOrEqual,
        expression1: expression1,
        expression2: expression2,
        message: message,
        file: file,
        line: line
    )
}

/// Asserts that an expression is `nil`.
///
/// - Parameters:
///   - expression: An asynchronous expression of `Any` type.
///   - message: An optional description of a failure.
///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
public func XCTAssertNilAsync(
    _ expression: @escaping @autoclosure () async throws -> Any?,
    _ message: @escaping @autoclosure () async -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    await _wrapSimpleCheck(
        assertion: XCTAssertNil,
        expression: expression,
        message: message,
        file: file,
        line: line
    )
}

/// Asserts that an expression doesn’t throw an error.
///
/// - Parameters:
///   - expression: An asynchronous expression.
///   - message: An optional description of a failure.
///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
public func XCTAssertNoThrowAsync<T>(
    _ expression: @escaping @autoclosure () async throws -> T,
    _ message: @escaping @autoclosure () async -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    await _wrapSimpleCheck(
        assertion: XCTAssertNoThrow,
        expression: expression,
        message: message,
        file: file,
        line: line
    )
}

/// Asserts that two values are not equal.
///
/// - Parameters:
///   - expression1: An asynchronous expression of type `T`.
///   - expression2: An asynchronous expression of type `T`.
///   - message: An optional description of a failure.
///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
public func XCTAssertNotEqualAsync<T: Equatable>(
    _ expression1: @escaping @autoclosure () async throws -> T,
    _ expression2: @escaping @autoclosure () async throws -> T,
    _ message: @escaping @autoclosure () async -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    await _wrapComparisonCheck(
        assertion: XCTAssertNotEqual,
        expression1: expression1,
        expression2: expression2,
        message: message,
        file: file,
        line: line
    )
}

/// Asserts that two floating-point values aren’t equal within a specified accuracy.
///
/// - Parameters:
///   - expression1: An asynchronous expression of type `T`.
///   - expression2: An asynchronous expression of type `T`.
///   - accuracy: An expression of type `T` describing the maximum difference between `expression1` and `expression2` for these values to be
///     considered equal.
///   - message: An optional description of a failure.
///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
public func XCTAssertNotEqualAsync<T: FloatingPoint>(
    _ expression1: @escaping @autoclosure () async throws -> T,
    _ expression2: @escaping @autoclosure () async throws -> T,
    accuracy: T,
    _ message: @escaping @autoclosure () async -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    await _wrapComparisonCheck(
        assertion: XCTAssertNotEqual,
        expression1: expression1,
        expression2: expression2,
        accuracy: accuracy,
        message: message,
        file: file,
        line: line
    )
}

/// Asserts that two numeric values aren’t equal within a specified accuracy.
///
/// - Parameters:
///   - expression1: An asynchronous expression of type `T`.
///   - expression2: An asynchronous expression of type `T`.
///   - accuracy: An expression of type `T` describing the maximum difference between `expression1` and `expression2` for these values to be
///     considered equal.
///   - message: An optional description of a failure.
///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
public func XCTAssertNotEqualAsync<T: Numeric>(
    _ expression1: @escaping @autoclosure () async throws -> T,
    _ expression2: @escaping @autoclosure () async throws -> T,
    accuracy: T,
    _ message: @escaping @autoclosure () async -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    await _wrapComparisonCheck(
        assertion: XCTAssertNotEqual,
        expression1: expression1,
        expression2: expression2,
        accuracy: accuracy,
        message: message,
        file: file,
        line: line
    )
}

/// Asserts that `expression1` is not identical to (i.e. the same object instance as) `expression2`.
///
/// - Parameters:
///   - expression1: An asynchronous expression of object type.
///   - expression2: An asynchronous expression of object type.
///   - message: An optional description of a failure.
///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
public func XCTAssertNotIdenticalAsync(
    _ expression1: @escaping @autoclosure () async throws -> AnyObject?,
    _ expression2: @escaping @autoclosure () async throws -> AnyObject?,
    _ message: @escaping @autoclosure () async -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    await _wrapComparisonCheck(
        assertion: XCTAssertNotIdentical,
        expression1: expression1,
        expression2: expression2,
        message: message,
        file: file,
        line: line
    )
}

/// Asserts that an expression is not `nil`.
///
/// - Parameters:
///   - expression: An asynchronous expression of `Any` type.
///   - message: An optional description of a failure.
///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
public func XCTAssertNotNilAsync(
    _ expression: @escaping @autoclosure () async throws -> Any?,
    _ message: @escaping @autoclosure () async -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    await _wrapSimpleCheck(
        assertion: XCTAssertNotNil, expression: expression, message: message, file: file, line: line)
}

/// Asserts that an expression throws an error.
///
/// - Parameters:
///   - expression: An asynchronous expression that can throw an error.
///   - message: An optional description of a failure.
///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
///   - errorHandler: An optional handler for errors that `expression throws.
public func XCTAssertThrowsErrorAsync<T>(
    _ expression: @escaping @autoclosure () async throws -> T,
    _ message: @escaping @autoclosure () async -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line,
    _ errorHandler: @escaping (_ error: any Error) -> Void = { _ in }
) async {
    await _wrapAsync(expressions: [expression], message: message) { syncExpressions, syncMessage in
        // https://github.com/apple/swift/issues/59578
        let assert =
            XCTAssertThrowsError
            as (() throws -> T, () -> String, StaticString, UInt, (Error) -> Void) -> Void

        assert(syncExpressions[0], syncMessage, file, line, errorHandler)
    }
}

/// Asserts that an expression is true.
///
/// - Parameters:
///   - expression: An asynchronous expression of boolean type.
///   - message: An optional description of a failure.
///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
public func XCTAssertTrueAsync(
    _ expression: @escaping @autoclosure () async throws -> Bool,
    _ message: @escaping @autoclosure () async -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    await _wrapSimpleCheck(
        assertion: XCTAssertTrue,
        expression: expression,
        message: message,
        file: file,
        line: line
    )
}

private func _wrapAsync<T>(
    expressions: [() async throws -> T],
    message: @escaping () async -> String,
    closure: @escaping ([() throws -> T], () -> String) -> Void
) async {
    var syncExpressions: [() throws -> T] = []
    for expression in expressions {
        do {
            let result = try await expression()
            syncExpressions.append({ result })
        } catch {
            syncExpressions.append({ throw error })
        }
    }

    let messageResult = await message()

    closure(syncExpressions, { messageResult })
}

private func _wrapSimpleCheck<T>(
    assertion: @escaping (() throws -> T, () -> String, StaticString, UInt) -> Void,
    expression: @escaping () async throws -> T,
    message: @escaping () async -> String,
    file: StaticString,
    line: UInt
) async {
    await _wrapAsync(expressions: [expression], message: message) { syncExpressions, syncMessage in
        assertion(syncExpressions[0], syncMessage, file, line)
    }
}

private func _wrapComparisonCheck<T>(
    assertion: @escaping (() throws -> T, () throws -> T, () -> String, StaticString, UInt) -> Void,
    expression1: @escaping () async throws -> T,
    expression2: @escaping () async throws -> T,
    message: @escaping () async -> String,
    file: StaticString,
    line: UInt
) async {
    await _wrapAsync(expressions: [expression1, expression2], message: message) {
        syncExpressions, syncMessage in
        assertion(syncExpressions[0], syncExpressions[1], syncMessage, file, line)
    }
}

private func _wrapComparisonCheck<T>(
    assertion: @escaping (() throws -> T, () throws -> T, T, () -> String, StaticString, UInt) ->
        Void,
    expression1: @escaping () async throws -> T,
    expression2: @escaping () async throws -> T,
    accuracy: T,
    message: @escaping () async -> String,
    file: StaticString,
    line: UInt
) async {
    await _wrapAsync(expressions: [expression1, expression2], message: message) {
        syncExpressions, syncMessage in
        assertion(syncExpressions[0], syncExpressions[1], accuracy, syncMessage, file, line)
    }
}
