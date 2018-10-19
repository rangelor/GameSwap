import UIKit

protocol DataEnteredDelegate{
    func userDidEnterInformation(info: String)
}

class AddAGameViewController: UIViewController {
    
    
    @IBOutlet weak var dataTextField: UITextField!
    var delegate: DataEnteredDelegate? = nil
    
    @IBAction func sendData(_ sender: Any) {
        if (delegate != nil){
            let information: String = (dataTextField.text ?? nil)!
            
            delegate!.userDidEnterInformation(info: information)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
