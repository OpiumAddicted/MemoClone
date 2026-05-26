//
//  Memo.swift
//  MemoClone
//
//  Created by Reze on 5/25/26.
//

import SwiftUI

struct Memo: Identifiable {
    let id = UUID()
    var content: String
    let created = Date()
}
