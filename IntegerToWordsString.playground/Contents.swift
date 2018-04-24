//: Playground - noun: a place where people can play

import UIKit
import Foundation

class IntegerToWords {
    let belowTen = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"]
    let belowTwenty = ["Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
    let belowHundred = ["", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
    
    func numberToWords(_ num: Int) -> String {
        if num == 0 {
            return "Zero"
        }
        return helper(number: num)
    }
    
    func helper(number: Int) -> String {
        var result = ""
        if number < 10 {
            result = belowTen[number]
        } else if number < 20 {
            result =  belowTwenty[number - 10]
        } else if number < 100 {
            result  = belowHundred[number/10] + " " + helper(number: number % 10)
        } else if number < 1000 {
            result = helper(number: number/100) + " Hundred " + helper(number: number % 100)
        } else if number < 1000000 {
            result = helper(number: number/1000) + " Thousand " + helper(number: number % 1000)
        } else if number < 1000000000 {
            result = helper(number: number/1000000) + " Million " + helper(number: number % 1000000)
        } else {
            result = helper(number: number/1000000000) + " Billion " + helper(number: number % 1000000000)
        }
        return result.trimmingCharacters(in: .whitespaces)
    }
}

class IntegerToWordsTests {
    func tests() {
        print(IntegerToWords().numberToWords(123) == "One Hundred Twenty Three")
        print(IntegerToWords().numberToWords(0) == "Zero")
        print(IntegerToWords().numberToWords(1) == "One")
        print(IntegerToWords().numberToWords(2) == "Two")
        print(IntegerToWords().numberToWords(3) == "Three")
        print(IntegerToWords().numberToWords(9) == "Nine")
        print(IntegerToWords().numberToWords(10) == "Ten")
        print(IntegerToWords().numberToWords(11) == "Eleven")
        print(IntegerToWords().numberToWords(12) == "Twelve")
        print(IntegerToWords().numberToWords(13) == "Thirteen")
        print(IntegerToWords().numberToWords(19) == "Nineteen")
        print(IntegerToWords().numberToWords(20) == "Twenty")
        print(IntegerToWords().numberToWords(21) == "Twenty One")
        print(IntegerToWords().numberToWords(30) == "Thirty")
        print(IntegerToWords().numberToWords(99) == "Ninety Nine")
        print(IntegerToWords().numberToWords(100) == "One Hundred")
        print(IntegerToWords().numberToWords(101) == "One Hundred One")
        print(IntegerToWords().numberToWords(555) == "Five Hundred Fifty Five")
        print(IntegerToWords().numberToWords(999) == "Nine Hundred Ninety Nine")
        print(IntegerToWords().numberToWords(12345) == "Twelve Thousand Three Hundred Forty Five")
        print(IntegerToWords().numberToWords(1234567) == "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven")
    }
}

IntegerToWordsTests().tests()



