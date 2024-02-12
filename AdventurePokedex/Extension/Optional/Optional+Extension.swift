//  Optional+Extension.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 12/02/24.

import Foundation

extension Optional where Wrapped == String {
    var nilCoalesced: String {
        guard let self = self else { return "" }
        return self
    }
}

extension Optional where Wrapped == Int {
    var nilCoalesced: Int {
        guard let self = self else { return 0 }
        return self
    }
}

extension Optional where Wrapped == Double {
    var nilCoalesced: Double {
        guard let self = self else { return 0.0 }
        return self
    }
}
