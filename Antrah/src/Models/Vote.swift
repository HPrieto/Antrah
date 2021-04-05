//
//  Vote.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/4/21.
//

import Foundation

struct Vote: Identifiable {
    public var id: String
    public var userId: String
    public var questionId: String
    public var vote: Int
    public var createTime: Date
}
