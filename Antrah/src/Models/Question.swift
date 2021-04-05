//
//  Question.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/4/21.
//

import UIKit

struct Question: Identifiable {
    public var id: String
    public var title: String
    public var body: String
    public var createTime: Date
    public var creatorId: String
}
