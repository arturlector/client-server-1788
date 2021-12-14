//
//  Data+PrettyJSON.swift
//  client-server-1788
//
//  Created by Artur Igberdin on 14.12.2021.
//

import Foundation

extension Data {
    
    var prettyJSON: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}
