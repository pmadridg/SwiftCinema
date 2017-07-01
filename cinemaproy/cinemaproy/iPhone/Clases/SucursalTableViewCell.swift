//
//  SucursalTableViewCell.swift
//  cinemaproy
//
//  Created by B303-18 on 1/07/17.
//  Copyright © 2017 B303-24. All rights reserved.
//

import UIKit

class SucursalTableViewCell: UITableViewCell {
    
    
   
    
    @IBOutlet weak var lblNombreSucursal: UILabel!
    
    @IBOutlet weak var imgSucursal: UIImageView!
    
     var objSucursal : SucursalBE!
    
    func actualizarData(){
        
        self.lblNombreSucursal.text = self.objSucursal.sucursal_nombre
        
        CDMImageDownloaded.descargarImagen(enURL: self.objSucursal.sucursal_urlImagen, paraImageView: self.imgSucursal, conPlaceHolder: nil) { (esCorrecto, nombreImagen, imagen) in
            
            self.imgSucursal.image = imagen
        }
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
