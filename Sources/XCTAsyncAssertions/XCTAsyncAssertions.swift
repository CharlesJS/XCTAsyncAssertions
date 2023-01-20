import XCTest

/// Asserts that an asynchronous expression is true.
///
/// - Parameters:
///   - expression: An asynchronous expression of Boolean type.
///   - message: An optional description of a failure.
///   - file: The file where the failure occurs. The default is the filename of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
public func XCTAssertAsync(
    _ expression: @autoclosure () async throws -> Bool,
    _ message: @autoclosure () async -> String = "",
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
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    _ message: @autoclosure () async -> String = "",
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
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    accuracy: T,
    _ message: @autoclosure () async -> String = "",
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
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    accuracy: T,
    _ message: @autoclosure () async -> String = "",
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
    _ expression: @autoclosure () async throws -> Bool,
    _ message: @autoclosure () async -> String = "",
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
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    _ message: @autoclosure () async -> String = "",
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
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    _ message: @autoclosure () async -> String = "",
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
    _ expression1: @autoclosure () async throws -> AnyObject?,
    _ expression2: @autoclosure () async throws -> AnyObject?,
    _ message: @autoclosure () async -> String = "",
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
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    _ message: @autoclosure () async -> String = "",
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
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    _ message: @autoclosure () async -> String = "",
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
    _ expression: @autoclosure () async throws -> Any?,
    _ message: @autoclosure () async -> String = "",
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
    _ expression: @autoclosure () async throws -> T,
    _ message: @autoclosure () async -> String = "",
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
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    _ message: @autoclosure () async -> String = "",
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
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    accuracy: T,
    _ message: @autoclosure () async -> String = "",
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
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    accuracy: T,
    _ message: @autoclosure () async -> String = "",
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
    _ expression1: @autoclosure () async throws -> AnyObject?,
    _ expression2: @autoclosure () async throws -> AnyObject?,
    _ message: @autoclosure () async -> String = "",
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
    _ expression: @autoclosure () async throws -> Any?,
    _ message: @autoclosure () async -> String = "",
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
    _ expression: @autoclosure () async throws -> T,
    _ message: @autoclosure () async -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line,
    _ errorHandler: (_ error: any Error) -> Void = { _ in }
) async {
    await _wrapAsync(expression, message: message) { syncExpression, syncMessage in
        // https://github.com/apple/swift/issues/59578
        let assert =
            XCTAssertThrowsError
            as (() throws -> T, () -> String, StaticString, UInt, (Error) -> Void) -> Void

        assert({ try syncExpression.get() }, { syncMessage }, file, line, errorHandler)
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
    _ expression: @autoclosure () async throws -> Bool,
    _ message: @autoclosure () async -> String = "",
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

private func _wrapSimpleCheck<T>(
    assertion: (() throws -> T, () -> String, StaticString, UInt) -> Void,
    expression: () async throws -> T,
    message: () async -> String,
    file: StaticString,
    line: UInt
) async {
    await _wrapAsync(expression, message: message) { syncExpression, syncMessage in
        assertion({ try syncExpression.get() }, { syncMessage }, file, line)
    }
}

private func _wrapComparisonCheck<T>(
    assertion: (() throws -> T, () throws -> T, () -> String, StaticString, UInt) -> Void,
    expression1: () async throws -> T,
    expression2: () async throws -> T,
    message: () async -> String,
    file: StaticString,
    line: UInt
) async {
    await _wrapAsync(expression1, expression2, message: message) { result1, result2, messageResult in
        assertion({ try result1.get() }, { try result2.get() }, { messageResult }, file, line)
    }
}

private func _wrapComparisonCheck<T>(
    assertion: (() throws -> T, () throws -> T, T, () -> String, StaticString, UInt) ->
        Void,
    expression1: () async throws -> T,
    expression2: () async throws -> T,
    accuracy: T,
    message: () async -> String,
    file: StaticString,
    line: UInt
) async {
    await _wrapAsync(expression1, expression2, message: message) { result1, result2, messageResult in
        assertion({ try result1.get() }, { try result2.get() }, accuracy, { messageResult }, file, line)
    }
}

private func _wrapAsync<T>(
    _ expression: () async throws -> T,
    message: () async -> String,
    closure: (Result<T, any Error>, String) -> Void
) async {
    let expressionResult: Result<T, any Error>
    do {
        expressionResult = .success(try await expression())
    } catch {
        expressionResult = .failure(error)
    }

    let messageResult = await message()

    closure(expressionResult, messageResult)
}

private func _wrapAsync<T>(
    _ expression1: () async throws -> T,
    _ expression2: () async throws -> T,
    message: () async -> String,
    closure: (Result<T, any Error>, Result<T, any Error>, String) -> Void
) async {
    let result1: Result<T, any Error>
    do {
        result1 = .success(try await expression1())
    } catch {
        result1 = .failure(error)
    }

    let result2: Result<T, any Error>
    do {
        result2 = .success(try await expression2())
    } catch {
        result2 = .failure(error)
    }

    let messageResult = await message()

    closure(result1, result2, messageResult)
}


