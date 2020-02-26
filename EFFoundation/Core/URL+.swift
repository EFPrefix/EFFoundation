//
//  URL+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

import Foundation

public extension URL {

    init?(unexpectedString: String?) {
        if let tryString = unexpectedString?.clean {
            if nil != URL(string: tryString) {
                self.init(string: tryString)
            } else {
                if let encodeString = tryString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                    self.init(string: encodeString)
                } else {
                    return nil
                }
            }
        } else {
            return nil
        }
    }

    var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true), let queryItems = components.queryItems else {
            return nil
        }
        var parameters = [String: String]()
        for item in queryItems {
            parameters[item.name] = item.value
        }
        return parameters
    }

    func addQueryParameter(key: String, value: String) -> URL {
        if let paramString = self.absoluteString.components(separatedBy: "?").last {
            let testBaseURL: String = "https://www.efqrcode.com"
            if let url = URL(unexpectedString: "\(testBaseURL)?\(paramString)") {
                var queryParameters = url.queryParameters ?? [String: String]()

                queryParameters.updateValue(value, forKey: key)

                var newQuery: String = "?"
                for queryParameter in queryParameters.enumerated() {
                    if newQuery != "?" {
                        newQuery += "&"
                    }
                    newQuery += "\(queryParameter.element.key)=\(queryParameter.element.value)"
                }

                let nonParamStringString = self.absoluteString.removeSuffix(string: "?" + paramString)
                return URL(unexpectedString: nonParamStringString + newQuery) ?? self
            }
        }
        return self
    }

    func removeQueryParameter(key: String) -> URL {
        if let paramString = self.absoluteString.components(separatedBy: "?").last {
            let testBaseURL: String = "https://www.efqrcode.com"
            if let url = URL(unexpectedString: "\(testBaseURL)?\(paramString)") {
                var queryParameters = url.queryParameters ?? [String: String]()

                queryParameters.removeValue(forKey: key)

                var newQuery: String = "?"
                for queryParameter in queryParameters.enumerated() {
                    if newQuery != "?" {
                        newQuery += "&"
                    }
                    newQuery += "\(queryParameter.element.key)=\(queryParameter.element.value)"
                }

                let nonParamStringString = self.absoluteString.removeSuffix(string: "?" + paramString)
                return URL(unexpectedString: nonParamStringString + newQuery) ?? self
            }
        }
        return self
    }
}
