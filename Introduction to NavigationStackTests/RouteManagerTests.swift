//
//  RouteManagerTests.swift
//  Introduction to NavigationStackTests
//
//  Created by Samet Çağrı Aktepe on 7.12.2023.
//

import XCTest
@testable import Introduction_to_NavigationStack

final class RouteManagerTests: XCTestCase {

    private var sut: NavigationRouter!
    
    override func setUp() {
        sut = NavigationRouter()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testRoutesShouldBeEmptyWhenInitialized() {
        XCTAssertTrue(sut.routes.isEmpty)
    }
    
    func testRoutesShouldNotBeEmptyWhenPushed() {
        sut.push(to: .cart)
        XCTAssertEqual(sut.routes.count, 1)
    }
    
    func testRoutesShouldBeEmptyWhenReset() {
        sut.push(to: .cart)
        sut.reset()
        XCTAssertTrue(sut.routes.isEmpty)
    }
    
    func testRoutesShouldBeEmptyWhenPopped() {
        sut.push(to: .cart)
        sut.goBack()
        XCTAssertTrue(sut.routes.isEmpty)
    }
    
    func testRoutesShouldBeEmptyWhenPoppedTwice() {
        sut.push(to: .cart)
        sut.goBack()
        sut.goBack()
        XCTAssertTrue(sut.routes.isEmpty)
    }
    
    func testRoutesShouldNotBeEmptyWhenPushedTwice() {
        sut.push(to: .cart)
        sut.push(to: .menuItem(item: foods[0]))
        XCTAssertEqual(sut.routes.count, 2)
    }
    
    func testRoutesShouldBeEmptyWhenPoppedAndPushed() {
        sut.push(to: .cart)
        sut.goBack()
        sut.push(to: .menuItem(item: foods[0]))
        XCTAssertEqual(sut.routes.count, 1)
    }
    
    func testRoutesShouldBeEmptyWhenPoppedTwiceAndPushed() {
        sut.push(to: .cart)
        sut.goBack()
        sut.goBack()
        sut.push(to: .menuItem(item: foods[0]))
        XCTAssertEqual(sut.routes.count, 1)
    }

}
