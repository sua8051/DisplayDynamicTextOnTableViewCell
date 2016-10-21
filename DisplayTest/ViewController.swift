//
//  ViewController.swift
//  DisplayTest
//
//  Created by Sua Le on 10/21/16.
//  Copyright © 2016 Sua Le. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView : UITableView!
    
    var texts = ["The suit has been brought by University of Virginia’s Associate Dean of Students, Nicole Eramo, who says the magazine’s November 19, 2014 cover story, “A Rape on Campus”, damaged her career and her health.",
                 "Ms Eramo claims Ms Erdely cast her as the “chief villain” who sought to protect the school by discouraging Jackie from reporting her alleged assault to police.",
                 "A subsequent police investigation found no evidence to back up Jackie’s claims and scrutiny by other media organisations",
                 "in particular The Washington Post, uncovered serious inconsistencies and gaping holes in her narrative",
                 "Ms Eramo wept in court on Tuesday as",
                 "The suit has been brought by University of Virginia’s Associate Dean of Students, Nicole Eramo, who says the magazine’s November 19, 2014 cover story, “A Rape on Campus”, damaged her career and her health.",
                 "Ms Eramo claims Ms Erdely cast her as the “chief villain” who sought to protect the school by discouraging Jackie from reporting her alleged assault to police.",
                 "A subsequent police investigation found no evidence to back up Jackie’s claims and scrutiny by other media organisations",
                 "in particular The Washington Post, uncovered serious inconsistencies and gaping holes in her narrative",
                 "Ms Eramo wept in court on Tuesday as"
                 ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 200
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell") as! MyCell
        cell.mainText.text = texts[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return calcHeight(indexPath)
    }
    
    func heightForView(text:String, font: UIFont, width: CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.bounds.height
    }

    
    func calcHeight(index: NSIndexPath) -> CGFloat{
        // Create a paragraph style with the desired line break mode
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell") as! MyCell
        
        let content = texts[index.row]
        
        let height = heightForView(content, font: cell.mainText.font, width: cell.bounds.width)
        print("heigt: \(height)")
        return height + 40
    }
}

