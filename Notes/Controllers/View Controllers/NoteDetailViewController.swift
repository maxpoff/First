//
//  NoteDetailViewController.swift
//  Notes
//
//  Created by Maxwell Poffenbarger on 1/10/20.
//  Copyright © 2020 Poff Daddy. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    //MARK: Properties
    var note: Note?
    
    //MARK: Outlets
    @IBOutlet weak var noteTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let noteText = noteTextField.text else {return}
        if let note = note {
            NoteController.sharedInstance.updateNote(note: note, newNoteText: noteText)
        } else {
            NoteController.sharedInstance.createNewNote(newNoteText: noteText)
        }
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: Helper
    func updateViews() {
        guard let note = note else {return}
        noteTextField.text = note.noteText
    }
}//End of class
