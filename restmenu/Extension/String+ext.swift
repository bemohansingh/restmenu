//
//  String+ext.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 01/03/2023.
//

import Foundation

extension String {
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
    func containsIgnoringCase(find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
}
