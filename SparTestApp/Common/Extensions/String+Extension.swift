//
//  String+Extension.swift
//  Spar Online TestApp
//
//  Created by Борис Кравченко on 27.08.2024.
//

import Foundation

extension String {
    
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
    
    func localized(with args: CVarArg...) -> String {
        String(format: localized, arguments: args)
    }
    
    func localized(bundle: Bundle = .main, tableName: String? = nil) -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: "", comment: "")
    }
}
