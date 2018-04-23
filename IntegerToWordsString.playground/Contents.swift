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

print(IntegerToWords().numberToWords(123))
