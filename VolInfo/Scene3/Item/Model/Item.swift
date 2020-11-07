//
//  Item.swift
//  Soldier
//
//  Created by Tigran Gishyan on 10/26/20.
//

import Foundation
//
// MARK: - Item
//
struct Item: Codable {
    let addeddate, itemname, itempriority: String?
    let itemcount: Int?
}
