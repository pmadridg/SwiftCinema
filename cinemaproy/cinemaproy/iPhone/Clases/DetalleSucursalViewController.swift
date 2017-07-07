//
//  DetalleSucursalViewController.swift
//  cinemaproy
//
//  Created by B303-19 on 5/07/17.
//  Copyright © 2017 B303-24. All rights reserved.
//

import UIKit

class DetalleSucursalViewController: UIViewController {
    
    
    @IBOutlet weak var imgSucursal: UIImageView!
    
    @IBOutlet weak var lblNombreSucursal: UILabel!
    
    @IBOutlet weak var lblDireccionSucursal: UILabel!
    
    var objSucursal : SucursalBE!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        CDMImageDownloaded.descargarImagen(enURL: self.objSucursal?.sucursal_urlImagen, paraImageView: self.imgSucursal, conPlaceHolder: nil) { (esCorrecto, nombreImagen, imagen) in
            
            self.imgSucursal.image = imagen
        }
        self.lblNombreSucursal.text = self.objSucursal.sucursal_nombre!
        self.lblDireccionSucursal.text = self.objSucursal.sucursal_direccion!
        
        
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
