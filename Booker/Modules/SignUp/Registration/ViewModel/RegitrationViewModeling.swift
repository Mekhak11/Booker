//
//  RegitrationViewModeling.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 06.05.23.
//
import Foundation

protocol RegitrationViewModeling: ObservableObject {
    var isLoading: Bool { get set }
    var error: RequestServiceError? { get set }
    var isContentValid: Bool { get set }
 
    var payload: RegistrationPayload { get set }
    var writerType: WriterType? { get set }
    var confirmPass: String  { get set }
    var dateOfBirth: Date { get set }
    
    func register(complition: @escaping ()->())
}


