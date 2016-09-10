//
//  Utilidades.swift
//  Criba De Erastótenes
//
//  Created by Gerson Montenegro on 6/09/16.
//  Copyright © 2016 Gerson Montenegro. All rights reserved.
//

import Foundation
import UIKit

class Utilities{
    /*
     Alert          Show a message popup
     parameters     msg:String      The message to show
                    title:String    Title for popup
     type
    */
    static func Alert(msg:String, title:String = "Primes numbers") {
        let alert:UIAlertView = UIAlertView()
        alert.addButtonWithTitle("Ok")
        alert.title = title
        alert.message = msg
        alert.show()
    }
    
    /*
     UpdateNSDictionary                 Update the element indicate by the index, in the position indicate by key of an [NSDictionary]
     parameters     value:AnyObject     Value to assign
                    key:AnyObject       The 'key' where the 'value' will be assigned
                    index:Int           The index of the element to modify
                    col:[NSDictionary]  Collection with the original data
     type           [NSDictionary]      Collection with the updated data
     */
    static func UpdateNSDictionary(value:AnyObject, key:AnyObject, index:Int, col:[NSDictionary]) -> [NSDictionary]{
        var colAux:[NSDictionary] = col
        if var reg = col[index] as? [String: AnyObject]{
            reg[key as! String] = value
            colAux[index] = reg
        }
        return colAux
    }
    
    /*
     getValueFromNSDictionary           Get the value assigned to a key in an index owned to a NSDictionary collection
     parameters         key:AnyObject       Key to extract the value
                        index:Int           Index of the item to get the value
                        col:[NSDictionary]  Collection with the data source
     type               AnyObject           The value that was extracted
     */
    static func getValueFromNSDictionary(key:AnyObject, index:Int, col:[NSDictionary]) -> AnyObject{
        if var reg = col[index] as? [String: AnyObject]{
            return reg[key as! String]!
        }
        return ""
    }
}