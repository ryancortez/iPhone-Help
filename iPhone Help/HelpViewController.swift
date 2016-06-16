//
//  ViewController.swift
//  iPhone Help
//
//  Created by Ryan Cortez on 6/15/16.
//  Copyright © 2016 Ryan Cortez. All rights reserved.
//

import UIKit

class HelpViewController: TopicViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonHandler = JSONHandler()
        jsonHandler.jsonFromURL("http://www.ryancortez.com/test.json")
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let videoCell = VideoCell(style: UITableViewCellStyle.Default, reuseIdentifier: "VideoCell")
        return videoCell
    }
}

