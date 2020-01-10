//
//  NoteListTableViewController.swift
//  Notes
//
//  Created by Maxwell Poffenbarger on 1/10/20.
//  Copyright © 2020 Poff Daddy. All rights reserved.
//

import UIKit

class NoteListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NoteController.sharedInstance.loadFromPersistantStore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoteController.sharedInstance.notes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        
        let note = NoteController.sharedInstance.notes[indexPath.row]
        cell.textLabel?.text = note.noteText

        return cell
    }

        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let noteToDelete = NoteController.sharedInstance.notes[indexPath.row]
            NoteController.sharedInstance.deleteNote(note: noteToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDOO
        if segue.identifier == "toDetailVC" {
            if let index = tableView.indexPathForSelectedRow {
                guard let destinationVC = segue.destination as? NoteDetailViewController else {return}
                let note = NoteController.sharedInstance.notes[index.row]
                destinationVC.note = note
            }
        }
    }
}//End of class
