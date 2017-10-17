//
//  MoneyTests.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import XCTest

import SimpleDomainModel

//////////////////
// MoneyTests
//
class MoneyTests: XCTestCase {
  
  let tenUSD = Money(amount: 10, currency: Money.mCurrency.USD)
  let twelveUSD = Money(amount: 12, currency: Money.mCurrency.USD)
  let fiveGBP = Money(amount: 5, currency: Money.mCurrency.GBP)
  let fifteenEUR = Money(amount: 15, currency: Money.mCurrency.EUR)
  let fifteenCAN = Money(amount: 15, currency: Money.mCurrency.CAN)
  
  func testCanICreateMoney() {
    let oneUSD = Money(amount: 1, currency: Money.mCurrency.USD)
    XCTAssert(oneUSD.amount == 1)
    XCTAssert(oneUSD.currency == Money.mCurrency.USD)
    
    let tenGBP = Money(amount: 10, currency: Money.mCurrency.GBP)
    XCTAssert(tenGBP.amount == 10)
    XCTAssert(tenGBP.currency == Money.mCurrency.GBP)
  }
  
  func testUSDtoGBP() {
    let gbp = tenUSD.convert(Money.mCurrency.GBP)
    XCTAssert(gbp.currency == Money.mCurrency.GBP)
    XCTAssert(gbp.amount == 5)
  }
  func testUSDtoEUR() {
    let eur = tenUSD.convert(Money.mCurrency.EUR)
    XCTAssert(eur.currency == Money.mCurrency.EUR)
    XCTAssert(eur.amount == 15)
  }
  func testUSDtoCAN() {
    let can = twelveUSD.convert(Money.mCurrency.CAN)
    XCTAssert(can.currency == Money.mCurrency.CAN)
    XCTAssert(can.amount == 15)
  }
  func testGBPtoUSD() {
    let usd = fiveGBP.convert(Money.mCurrency.USD)
    XCTAssert(usd.currency == Money.mCurrency.USD)
    XCTAssert(usd.amount == 10)
  }
  func testEURtoUSD() {
    let usd = fifteenEUR.convert(Money.mCurrency.USD)
    XCTAssert(usd.currency == Money.mCurrency.USD)
    XCTAssert(usd.amount == 10)
  }
  func testCANtoUSD() {
    let usd = fifteenCAN.convert(Money.mCurrency.USD)
    XCTAssert(usd.currency == Money.mCurrency.USD)
    XCTAssert(usd.amount == 12)
  }
  
  func testUSDtoEURtoUSD() {
    let eur = tenUSD.convert(Money.mCurrency.EUR)
    let usd = eur.convert(Money.mCurrency.USD)
    XCTAssert(tenUSD.amount == usd.amount)
    XCTAssert(tenUSD.currency == usd.currency)
  }
  func testUSDtoGBPtoUSD() {
    let gbp = tenUSD.convert(Money.mCurrency.GBP)
    let usd = gbp.convert(Money.mCurrency.USD)
    XCTAssert(tenUSD.amount == usd.amount)
    XCTAssert(tenUSD.currency == usd.currency)
  }
  func testUSDtoCANtoUSD() {
    let can = twelveUSD.convert(Money.mCurrency.CAN)
    let usd = can.convert(Money.mCurrency.USD)
    XCTAssert(twelveUSD.amount == usd.amount)
    XCTAssert(twelveUSD.currency == usd.currency)
  }
  
  func testAddUSDtoUSD() {
    let total = tenUSD.add(tenUSD)
    XCTAssert(total.amount == 20)
    XCTAssert(total.currency == Money.mCurrency.USD)
  }
  
  func testAddUSDtoGBP() {
    let total = tenUSD.add(fiveGBP)
    XCTAssert(total.amount == 10)
    XCTAssert(total.currency == Money.mCurrency.GBP)
  }
}

