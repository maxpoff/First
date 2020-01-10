//
//  NoteController.swift
//  Notes
//
//  Created by Maxwell Poffenbarger on 1/10/20.
//  Copyright © 2020 Poff Daddy. All rights reserved.
//

import Foundation

class NoteController {
    
    //Source of truth
    var notes: [Note] = []
    
    //Singleton
    static let sharedInstance = NoteController()
    
    //MARK: CRUD
    //Create
    func createNewNote(newNoteText: String) {
        let note = Note(noteText: newNoteText)
        notes.append(note)
        //Save
        saveToPersistentStore()
    }
    
    //Update
    func updateNote(note: Note, newNoteText: String) {
        note.noteText = newNoteText
        //Save
        saveToPersistentStore()
    }
    
    //Delete
    func deleteNote(note: Note) {
        guard let index = notes.firstIndex(of: note) else {return}
        notes.remove(at: index)
        //Save
        saveToPersistentStore()
    }
    
    //MARK: PERSISTENCE
    func createFileForPersistence() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("Note.json")
        return fileURL
    }
    
    func saveToPersistentStore() {
        let jsonEncoder = JSONEncoder()
        do {
            let jsonNotes = try jsonEncoder.encode(notes)
            try jsonNotes.write(to: createFileForPersistence())
        } catch let encodingError {
            print("There was an error saving the data! \(encodingError.localizedDescription)")
        }
    }
    
    func loadFromPersistantStore() {
        let jsonDecoder = JSONDecoder()
        do {
            let jsonData = try Data(contentsOf: createFileForPersistence())
            let decodedNoteArray = try jsonDecoder.decode([Note].self, from: jsonData)
            notes = decodedNoteArray
        } catch let decodingError {
            print("There was an error loading the data! \(decodingError.localizedDescription)")
        }
    }
}//End of class
