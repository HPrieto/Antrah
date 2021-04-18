//
//  User.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/4/21.
//

import Foundation

struct User: Identifiable {
    public var id: String
    public var email: String
    public var password: String
    public var firstName: String
    public var lastName: String
    public var username: String
    public var phone: String
    public var bio: String
    public var createTime: Date
    public var imageUrl: String?
}
