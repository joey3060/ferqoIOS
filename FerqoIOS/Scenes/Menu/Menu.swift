//
//  Menu.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/11.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

struct ListItem {
    var item: String
    var iconName: String = ""
}

class Menu: UITableViewController {

    var List: Array<ListItem> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1)
        tableView.separatorInset = UIEdgeInsetsMake(0, 64, 0, 0)
        // Do any additional setup after loading the view.
    }
    
    func setUpMenuItems(_ items: Array<ListItem>) {
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
