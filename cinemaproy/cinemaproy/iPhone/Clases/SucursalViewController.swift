//
//  SucursalViewController.swift
//  cinemaproy
//
//  Created by B303-18 on 1/07/17.
//  Copyright © 2017 B303-24. All rights reserved.
//

import UIKit

class SucursalViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tlbSucursales: UITableView!
    
    var arraySucursales = NSMutableArray()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arraySucursales.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "SucursalTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SucursalTableViewCell
        cell.objSucursal = self.arraySucursales[indexPath.row] as! SucursalBE
        cell.actualizarData()
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "DetalleSucursalViewController", sender: self.arraySucursales[indexPath.row])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SucursalBC.listarSucursales { (arraySucursales) in
            
            self.arraySucursales = arraySucursales
            self.tlbSucursales.reloadData()
        }

        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
