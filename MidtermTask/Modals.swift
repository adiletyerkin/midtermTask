//
//  Modals.swift
//  MidtermTask
//
//  Created by Macbook Pro 2020 on 10/16/20.
//  Copyright © 2020 Macbook Pro 2020. All rights reserved.
//

import Foundation

class Character  : Decodable{
//        var house : AnyObject?
        var name : String
//        var quotes : [String]
        var slug : String
}

class House : Decodable{

var members : [Member]?
var name : String?
var slug : String?
}

class Member : Decodable{

var name : String?
var slug : String?
}

//
//class Qoutes : Decodable{
//    var sentence : String?
//}
//
//
//
//class TarHouse : Decodable{
//
//    var name : String?
//
//    var region : String?
//
//    var words : String?
//
//}
