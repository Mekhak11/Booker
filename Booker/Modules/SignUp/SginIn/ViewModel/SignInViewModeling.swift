//
//  SignInViewModeling.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation

protocol SignInViewModeling:ObservableObject {
    var isLoading: Bool { get set }
    var error: RequestServiceError? { get set }
    var isContentValid: Bool { get set }
    var payload: SignInPayload { get set }
    
    func signIn(complition: @escaping ()->())
}
