//
//  RegitrationDto.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 06.05.23.
//

import Foundation

struct  RegistrationPayload {
    var firstname, lastname, email, password: String
    var mainGenre, dateOfBirth, role, description: String
    
    init(firstname: String, lastname: String, email: String, password: String, mainGenre: String, dateOfBirth: String, role: String, description: String) {
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = password
        self.mainGenre = mainGenre
        self.dateOfBirth = dateOfBirth
        self.role = "AUTHOR"
        self.description = description
    }
    init() {
        self.firstname = ""
        self.lastname = ""
        self.email = ""
        self.password = ""
        self.mainGenre = ""
        self.dateOfBirth = ""
        self.role = "AUTHOR"
        self.description = ""
    }
}
