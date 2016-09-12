//
//  Primos.swift
//  Criba De Erastótenes
//
//  Created by Gerson Montenegro on 6/09/16.
//  Copyright © 2016 Gerson Montenegro. All rights reserved.
//

import Foundation
import UIKit

/*
 Primes         Class for calculate if a number is prime with CalculatePrime function,
                or calculate the Sieve of Eratostenes through diferents methods
 */
class Primes{
    var numStartValue: Int = 0          //start value. By default 2
    var numEndValue: Int = 0            //End value extracted from the text field
    var dictData: [NSDictionary] = []   //All values and it's state
    var numCurrentValue:Int = 0         //Number to start every iteration
    var numCurrentIndex:Int = 0         //Index in dictData to current value
    
    /*
     StartSieve         Start the process to calculate the Sieve of Eratostenes
     parameters         i:Int       Start value. By default 2
                        f:Int       End value
     type               String      Empty if f is less than i, else the string with the result of Sieve
     
     */
    func StartSieve(i:Int, f:Int) -> String{
        self.numEndValue = f
        self.numStartValue = i
        if (self.numEndValue > self.numStartValue) {
            self.MakeValuesDictionary()
            self.UpdateValues()
            //self.refTxtResult.text = self.WalkThrough()
            return self.WalkThrough()
        }else{
            return "" //start is bigger than end
        }
    }
    
    /*
     MakeValuesDictionary       Start in 0 the estate of every value in the origin
     parameters
     type
     */
    func MakeValuesDictionary() {
        self.dictData.removeAll()
        for i in self.numStartValue...self.numEndValue{
            self.dictData.append(["valor": i, "estado": 0])
        }
    }
    
    /*
     UpdateValues       Set in the current iteration the value at the calculation start
     parameters
     type
     */
    func UpdateValues(){
        self.numCurrentValue = self.NextValue()
        if let indiceA = self.dictData.indexOf(["valor": self.numCurrentValue, "estado": 0]){
            self.numCurrentIndex = indiceA
        }else{
            Utilities.Alert("There's an error reading current index: \(self.numCurrentValue)")
        }
    }
    
    /*
     WalkThrough        This function it's going comparing until the next value without mark as -1 multiplied by himself, be less that the endValue
     parameters
     type               String      List of primes numbers
     */
    func WalkThrough() -> String{
        while pow( Double(self.numCurrentValue), 2.0) <= Double(self.numEndValue){
            self.Compare()
        }
        return self.MakeResume()
    }
    
    /*
     MakeResume         Make the list of numbers without mark as multiples. At the end of calculus, if a number has no mark (it's mean that it's state is 0, or has the -1 mark)
     parameters         
     type               String
     */
    func MakeResume() -> String{
        var strResult:String = ""
        var numCurrentState = 0
        for (indice, _) in self.dictData.enumerate(){
            numCurrentState = Utilities.getValueFromNSDictionary("estado", index: indice, col: self.dictData) as! Int
            if numCurrentState <= 0{
                strResult.appendContentsOf( "\(String(Utilities.getValueFromNSDictionary("valor", index: indice, col: self.dictData) as! Int))," )
            }
        }
        return strResult.substringToIndex(strResult.endIndex.predecessor())
    }
    
    /*
     Compare        Walkthough of the data dictionary to mark all numbers that they are multiples of any other.
                    At the end, mark the current vault to -1 to indicate that it's prime
     parameters
     type
     */
    func Compare(){
        for (k, v) in self.dictData.enumerate(){
            if (v["valor"]! as! Int) != self.numCurrentValue{
                if (v["valor"]! as! Int) % self.numCurrentValue == 0{
                    self.dictData = Utilities.UpdateNSDictionary(1, key: "estado", index: k, col: self.dictData)
                }
            }
        }
        self.dictData = Utilities.UpdateNSDictionary(-1, key: "estado", index: self.numCurrentIndex, col: self.dictData)
        self.UpdateValues()
    }
    
    /*
     NextValue
     parameters :
     type       :   Int         The next value from the sieve to restart the walkthrough. The algoritm select
                                the next number from the begin that is not market
     */
    func NextValue() -> Int{
        var numNextVal:Int = 0
        for (_, v) in self.dictData.enumerate(){
            if (v["estado"]! as! Int) == 0{
                numNextVal = v["valor"]! as! Int
                break
            }
        }
        return numNextVal
    }
    
    /*
     CalcutatePrime
     parameters :   value:Int   The number for calculate if it's prime or nor
     type     :   Bool        True if it's prime, False if not
     */
    func CalculatePrime(value: Int) -> Bool{
        for i in (2 ..< value).reverse(){
            if value % i == 0{
                return false
            }
        }
        return true
    }
    
//  check this out https://iluxonchik.github.io/regular-expression-check-if-number-is-prime/
//  check this out http://gaussianos.com/la-sorprendente-criba-de-la-parabola/
}