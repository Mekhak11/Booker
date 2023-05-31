//
//  SearcgViewModelinng.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 10.05.23.
//

import Foundation

protocol SearcgViewModeling: ObservableObject {
    var isLoading: Bool { get set }
    var error: RequestServiceError? { get set }
    
    var result: SearchResultModel { get set }
    
    func search(searchWord: String)
        
    
}
