//
//  AuthRoute.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 06.05.23.
//

import Foundation
import Moya

enum AuthRoute: TargetType {
    case regiter(payload: RegistrationPayload)
    case logIn(payload: SignInPayload)
    case getUsers
    case getBooke(id: Int)
    case getAllBooks
    case likeWriter(id: Int)
    case unlikeWriter(id: Int)
    case likeArticle(id: Int)
    case unlikeArticle(id: Int)
    case postArticle(payload: ArticlePayload)
    case getMe
    case getMyArticles
    case getFavoriteWriters
    case getFavoriteArticles
    case search(payload: String)
    
    var baseURL: URL {
        return RequestServices.Auth.baseUrl
    }
    
    var path: String {
        switch self {
        case .regiter:
            return "/api/auth/register"
        case .getUsers:
            return "/api/user"
        case .getBooke(id: let id):
            return "/api/article/author/\(id)"
        case .getAllBooks:
            return "/api/article"
        case .likeWriter(id: let id):
            return "/api/follow/\(id)"
        case .unlikeWriter(id: let id):
            return "/api/follow/\(id)"
        case .likeArticle(id: let id):
            return "/api/like/\(id)"
        case .unlikeArticle(id: let id):
            return "/api/like/\(id)"
        case .postArticle:
            return "/api/article"
        case .getMe:
            return "/api/myUser"
        case .getMyArticles:
            return "/api/article/my"
        case .getFavoriteWriters:
            return "/api/follow"
        case .getFavoriteArticles:
            return "/api/like"
        case .logIn:
            return "/api/auth/authenticate"
        case .search:
            return "api"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .regiter:
            return .post
        case .getUsers:
            return .get
        case .getBooke:
            return .get
        case .getAllBooks:
            return .get
        case .likeWriter:
            return .post
        case .unlikeWriter:
            return .delete
        case .likeArticle:
            return .post
        case .unlikeArticle:
            return .delete
        case .postArticle:
            return .post
        case .getMe:
            return .get
        case .getMyArticles:
            return .get
        case .getFavoriteWriters:
            return .get
        case .getFavoriteArticles:
            return .get
        case .logIn:
            return .post
        case .search:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .regiter(let payload):
            let params = [
                "firstname": payload.firstname,
                "lastname": payload.lastname,
                "email": payload.email,
                "password": payload.password,
                "mainGenre": payload.mainGenre,
                "dateOfBirth": payload.dateOfBirth,
                "description": payload.description,
                "role": "AUTHOR"
            ]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case .getUsers:
            return .requestPlain
        case .getBooke:
            return .requestPlain// .requestParameters(parameters: ["id": id], encoding: JSONEncoding.default)
        case .getAllBooks:
            return .requestPlain
        case .likeWriter:
            return .requestPlain
        case .unlikeWriter:
            return .requestPlain
        case .likeArticle:
            return .requestPlain
        case .unlikeArticle:
            return .requestPlain
        case .postArticle(payload: let payload):
            let params = [
                "title" : payload.title,
                "text" : payload.text
            ]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case .getMe:
            return .requestPlain
        case .getMyArticles:
            return .requestPlain
        case .getFavoriteWriters:
            return .requestPlain
        case .getFavoriteArticles:
            return .requestPlain
            
        case .logIn(payload: let payload):
            let params = [
                "email": payload.username,
                "password": payload.password
            ]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case .search(payload: let payload):
            return .requestParameters(parameters: ["search": payload], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        var token:TokenDto? = UserDefaultsService().getObject(forKey: .User.token) 
        return [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer \(token?.token ?? "")",
        ]
    }

    
    
}
