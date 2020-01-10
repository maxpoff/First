//
//  Note.swift
//  Notes
//
//  Created by Maxwell Poffenbarger on 1/10/20.
//  Copyright © 2020 Poff Daddy. All rights reserved.
//

import Foundation

class Note: Codable {
    
    var noteText: String
    var noteTimestamp: Date
    
    init(noteText: String, noteTimestamp: Date = Date()) {
        self.noteText = noteText
        self.noteTimestamp = noteTimestamp
    }
} // End of class

extension Note: Equatable {
    static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.noteText == rhs.noteText && lhs.noteTimestamp == rhs.noteTimestamp
    }
} //End of extension
