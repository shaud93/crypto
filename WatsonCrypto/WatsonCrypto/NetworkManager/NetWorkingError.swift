//
//  NetWorkingError.swift
//  WatsonCrypto
//
//  Created by D'Ante Watson on 2/21/24.
//

import Foundation
enum NetworkError:Error{
    case urlError(url: URL)
    case serverNotFound
    case dataNotFound
    case parsingError
}
// control + command + space for EMOJI

extension NetworkError:LocalizedError {
    var errorDescription: String?{
        switch self{
        case.urlError(url: let url):
            return NSLocalizedString("[🛑] API Url is wrong: \(url)", comment: "url error")
        case.serverNotFound:
            return NSLocalizedString("[🔎] Server do not exist", comment: "server not found")
        case.parsingError:
            return NSLocalizedString("[📝] data could not be parsed", comment: "parsing error")
        case.dataNotFound:
            return NSLocalizedString("[🔎] couldnt detect data", comment: "data not found")
        }
    }
}
