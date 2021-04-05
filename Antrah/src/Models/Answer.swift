//
//  Answer.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/4/21.
//

import Foundation

struct Answer: Identifiable {
    public var id: String
    public var questionId: String
    public var answer: String
    public var createTime: Date
    public var creatorId: String
}
