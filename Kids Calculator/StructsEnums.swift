//
//  StructsEnums.swift
//  Kids Calculator
//
//  Created by VX on 28/08/16.
//  Copyright © 2016 VXette. All rights reserved.
//

import Foundation

enum Operator :String {
    case add = "+"
    case subtract = "-"
    case times = "*"
    case divide = "/"
    case nothing = ""
}

enum CalculationState :String {
    case enteringNumber = "enteringNumber"
    case newNumStarted = "newNumStarted"
}
