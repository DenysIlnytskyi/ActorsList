//
//  Actor.swift
//  44444
//
//  Created by Денис Ільницький on 20/01/2023.
//

import Foundation

struct ActorsList: Codable {
    let actors: [Actor]
}

struct Actor: Codable {
    let children: String
    let country: String
    let description: String
    let dob: String
    let gender: String
    let height: String
    let image: String
    let name: String
    let spouse: String
    let wiki: String
}

enum Link: String {
    case restAddress = "https://www.infotech.sk/Service/Service.svc/getData"
}

