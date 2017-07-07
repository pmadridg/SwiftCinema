
import UIKit

class HorarioTableViewCell: UITableViewCell {

    @IBOutlet weak var lblHorario: UILabel!
    
    
    var objHorario : Horario?
    
    
    
    func actualizarData(){
        
        self.lblHorario.text = self.objHorario!.horario_horario!

        
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
