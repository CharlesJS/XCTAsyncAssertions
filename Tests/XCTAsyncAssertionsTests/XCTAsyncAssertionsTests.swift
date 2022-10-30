//
//  XCTAsyncAssertionsTests.swift
//  Well now, isn't this meta.
//
//
//  Created by Charles Srstka on 6/19/22.
//

import XCTAsyncAssertions
import XCTest

class XCTAsyncAssertionsTests: XCTestCase {
    private func expectFailure(
        _ reason: String, file: String = #filePath, line: UInt = #line, lineOffset: UInt = 1
    ) {
        XCTExpectFailure { failure in
            guard let location = failure.sourceCodeContext.location else { return false }

            return
                (failure.type == .assertionFailure && failure.compactDescription == reason
                && location.fileURL.path == file && location.lineNumber == line + lineOffset)
        }
    }

    func testXCTAssertAsync() async {
        await XCTAssertAsync(true)

        self.expectFailure("XCTAssertTrue failed")
        await XCTAssertAsync(false)
    }

    func testXCTAssertEqualAsync() async {
        await XCTAssertEqualAsync("Foo", "Foo")
        await XCTAssertEqualAsync(1.23, 1.23, accuracy: 0.01)
        await XCTAssertEqualAsync(1.23, 1.231, accuracy: 0.01)
        await XCTAssertEqualAsync(123 as Int, 123 as Int, accuracy: 1)
        await XCTAssertEqualAsync(123 as Int, 124 as Int, accuracy: 1)

        self.expectFailure("XCTAssertEqual failed: (\"Foo\") is not equal to (\"Bar\")")
        await XCTAssertEqualAsync("Foo", "Bar")

        self.expectFailure(
            "XCTAssertEqualWithAccuracy failed: (\"1.23\") is not equal to (\"2.34\") +/- (\"0.01\")")
        await XCTAssertEqualAsync(1.23, 2.34, accuracy: 0.01)

        self.expectFailure(
            "XCTAssertEqualWithAccuracy failed: (\"1.23\") is not equal to (\"1.231\") +/- (\"0.001\")")
        await XCTAssertEqualAsync(1.23, 1.231, accuracy: 0.001)

        self.expectFailure(
            "XCTAssertEqualWithAccuracy failed: (\"123\") is not equal to (\"125\") +/- (\"1\")")
        await XCTAssertEqualAsync(123, 125, accuracy: 1)
    }

    func testXCTAssertFalseAsync() async {
        await XCTAssertFalseAsync(false)

        self.expectFailure("XCTAssertFalse failed")
        await XCTAssertAsync(true)
    }

    func testXCTAssertGreaterThanAsync() async {
        await XCTAssertGreaterThanAsync(2, 1)

        self.expectFailure("XCTAssertGreaterThan failed: (\"2\") is not greater than (\"2\")")
        await XCTAssertGreaterThanAsync(2, 2)

        self.expectFailure("XCTAssertGreaterThan failed: (\"2\") is not greater than (\"3\")")
        await XCTAssertGreaterThanAsync(2, 3)
    }

    func testXCTAssertGreaterThanOrEqualAsync() async {
        await XCTAssertGreaterThanOrEqualAsync(2, 1)
        await XCTAssertGreaterThanOrEqualAsync(2, 2)

        self.expectFailure("XCTAssertGreaterThanOrEqual failed: (\"2\") is less than (\"3\")")
        await XCTAssertGreaterThanOrEqualAsync(2, 3)
    }

    func testXCTAssertIdenticalAsync() async {
        let obj1 = NSObject()
        let obj2 = NSObject()
        let identical = obj1

        await XCTAssertIdenticalAsync(obj1, identical)

        self.expectFailure(
            "XCTAssertIdentical failed: (\"\(obj1.debugDescription)\") is not identical to (\"\(obj2.debugDescription)\")",
            lineOffset: 4
        )
        await XCTAssertIdenticalAsync(obj1, obj2)
    }

    func testXCTAssertLessThanAsync() async {
        await XCTAssertLessThanAsync(1, 2)

        self.expectFailure("XCTAssertLessThan failed: (\"2\") is not less than (\"2\")")
        await XCTAssertLessThanAsync(2, 2)

        self.expectFailure("XCTAssertLessThan failed: (\"3\") is not less than (\"2\")")
        await XCTAssertLessThanAsync(3, 2)
    }

    func testXCTAssertLessThanOrEqualAsync() async {
        await XCTAssertLessThanOrEqualAsync(1, 2)
        await XCTAssertLessThanOrEqualAsync(2, 2)

        self.expectFailure("XCTAssertLessThanOrEqual failed: (\"3\") is greater than (\"2\")")
        await XCTAssertLessThanOrEqualAsync(3, 2)
    }

    func testXCTAssertNilAsync() async {
        await XCTAssertNilAsync(nil as String?)

        self.expectFailure("XCTAssertNil failed: \"Foo\"")
        await XCTAssertNilAsync("Foo")
    }

    func testXCTAssertNoThrowAsync() async {
        await XCTAssertNoThrowAsync("Foo")

        self.expectFailure(
            "XCTAssertNoThrow failed: threw error \"Error Domain=NSPOSIXErrorDomain Code=22 \"Invalid argument\"\"",
            lineOffset: 4
        )
        await XCTAssertNoThrowAsync(try { throw POSIXError(.EINVAL) }())
    }

    func testXCTAssertNotEqualAsync() async {
        await XCTAssertNotEqualAsync("Foo", "Bar")
        await XCTAssertNotEqualAsync(1.23, 2.34, accuracy: 0.01)
        await XCTAssertNotEqualAsync(1.23, 1.231, accuracy: 0.001)
        await XCTAssertNotEqualAsync(123, 125, accuracy: 1)

        self.expectFailure("XCTAssertNotEqual failed: (\"Foo\") is equal to (\"Foo\")")
        await XCTAssertNotEqualAsync("Foo", "Foo")

        self.expectFailure(
            "XCTAssertNotEqualWithAccuracy failed: (\"1.23\") is equal to (\"1.23\") +/- (\"0.01\")")
        await XCTAssertNotEqualAsync(1.23, 1.23, accuracy: 0.01)

        self.expectFailure(
            "XCTAssertNotEqualWithAccuracy failed: (\"1.23\") is equal to (\"1.231\") +/- (\"0.01\")")
        await XCTAssertNotEqualAsync(1.23, 1.231, accuracy: 0.01)

        self.expectFailure(
            "XCTAssertNotEqualWithAccuracy failed: (\"123\") is equal to (\"123\") +/- (\"1\")")
        await XCTAssertNotEqualAsync(123 as Int, 123 as Int, accuracy: 1)

        self.expectFailure(
            "XCTAssertNotEqualWithAccuracy failed: (\"123\") is equal to (\"124\") +/- (\"1\")")
        await XCTAssertNotEqualAsync(123 as Int, 124 as Int, accuracy: 1)
    }

    func testXCTAssertNotIdenticalAsync() async {
        let obj1 = NSObject()
        let obj2 = NSObject()
        let identical = obj1

        await XCTAssertNotIdenticalAsync(obj1, obj2)

        self.expectFailure(
            "XCTAssertNotIdentical failed: (\"\(obj1.debugDescription)\") is identical to (\"\(obj1.debugDescription)\")",
            lineOffset: 4
        )
        await XCTAssertNotIdenticalAsync(obj1, identical)
    }

    func testXCTAssertNotNilAsync() async {
        await XCTAssertNotNilAsync("Foo")

        self.expectFailure("XCTAssertNotNil failed")
        await XCTAssertNotNilAsync(nil as String?)
    }

    func testXCTAssertThrowsErrorAsync() async {
        await XCTAssertThrowsErrorAsync(try { throw POSIXError(.EINVAL) }())

        var capturedError: Error? = nil
        await XCTAssertThrowsErrorAsync(try { throw POSIXError(.EINVAL) }()) { capturedError = $0 }

        XCTAssertEqual(capturedError as? POSIXError, POSIXError(.EINVAL))

        self.expectFailure("XCTAssertThrowsError failed: did not throw an error")
        await XCTAssertThrowsErrorAsync("Foo")
    }

    func testXCTAssertTrueAsync() async {
        await XCTAssertTrueAsync(true)

        self.expectFailure("XCTAssertTrue failed")
        await XCTAssertTrueAsync(false)
    }
}
