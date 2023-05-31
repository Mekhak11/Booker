//
//  AuthRepository.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 06.05.23.
//

import Foundation
import Combine
import Moya

protocol AuthRepository {
    func register(payload: RegistrationPayload) -> AnyPublisher<TokenDto, Error>
    func signIn(payload: SignInPayload) -> AnyPublisher<TokenDto,Error>
    
    func getWriters() -> AnyPublisher<[WriterDto], Error>
    func getAuthorBooks(id: Int) -> AnyPublisher<[BookDetailsDto],Error>
    func getAllBooks() -> AnyPublisher<[BookDetailsDto],Error>
    
    func like(id: Int) -> AnyPublisher<Bool, Error>
    func unLike(id: Int) -> AnyPublisher<Bool, Error>
    
    func likeArticle(id: Int) -> AnyPublisher<Bool, Error>
    func unlikeArticle(id: Int) -> AnyPublisher<Bool,Error>
    
    func postArticle(payload: ArticlePayload) -> AnyPublisher<Bool,Error>
    
    func getMe() -> AnyPublisher<WriterDto,Error>
    func getMyArticles() -> AnyPublisher<[BookDetailsDto], Error>
    func getFavoriteWriters() -> AnyPublisher<[WriterDto], Error>
    func getFavoriteArticles() -> AnyPublisher<[BookDetailsDto], Error>
    
    func search(searchWord: String) -> AnyPublisher<SearchResultDto, Error>
    
    
}

final class AuthDefaultRepository: MoyaProvider<AuthRoute>, AuthRepository, ObservableObject {
 
    
    func register(payload: RegistrationPayload) -> AnyPublisher<TokenDto, Error> {
         requestDecodable(.regiter(payload: payload))
    }
    func signIn(payload: SignInPayload) -> AnyPublisher<TokenDto, Error> {
        requestDecodable(.logIn(payload: payload))
    }
    func getWriters() -> AnyPublisher<[WriterDto], Error> {
        requestDecodable(.getUsers)
    }
    func getAuthorBooks(id: Int) -> AnyPublisher<[BookDetailsDto], Error> {
        requestDecodable(.getBooke(id: id))
    }
    func getAllBooks() -> AnyPublisher<[BookDetailsDto], Error> {
        requestDecodable(.getAllBooks)
    }
    
    func like(id: Int) -> AnyPublisher<Bool, Error> {
        requestDecodable(.likeWriter(id: id))
    }
    func unLike(id: Int) -> AnyPublisher<Bool, Error> {
        requestDecodable(.unlikeWriter(id: id))
    }
    
    
    func likeArticle(id: Int) -> AnyPublisher<Bool, Error> {
        requestDecodable(.likeArticle(id: id))
    }
    
    func unlikeArticle(id: Int) -> AnyPublisher<Bool, Error> {
        requestDecodable(.unlikeArticle(id: id))
    }
    
    
    func postArticle(payload: ArticlePayload) -> AnyPublisher<Bool, Error> {
        requestDecodable(.postArticle(payload: payload))
    }
    
    func getMe() -> AnyPublisher<WriterDto,Error> {
        requestDecodable(.getMe)
    }
    
    func getMyArticles() -> AnyPublisher<[BookDetailsDto], Error> {
        requestDecodable(.getMyArticles)
    }
    
    func getFavoriteWriters() -> AnyPublisher<[WriterDto], Error> {
        requestDecodable(.getFavoriteWriters)
    }
    func getFavoriteArticles() -> AnyPublisher<[BookDetailsDto], Error> {
        requestDecodable(.getFavoriteArticles)
    }
    
    func search(searchWord: String) -> AnyPublisher<SearchResultDto, Error> {
        requestDecodable(.search(payload: searchWord))
    }
    
    
}
