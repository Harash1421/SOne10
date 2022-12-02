import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var main_tvApperances:UILabel!
    @IBOutlet weak var maion_buChangeApperances:UIButton!
    var loadApperance = UserDefaults.standard.string(forKey: "ApperanceMode")
    var apperances = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apperances = loadApperance!
        print(apperances)
        if(apperances == "Dark"){
            overrideUserInterfaceStyle = .dark
        }else{
            overrideUserInterfaceStyle = .light
        }
    }
    
    @IBAction func main_buChangeApperances(_ sender:Any){
        showToastAction()
    }
    
    //Show Toast Action
    func showToastAction(){
        let alert = UIAlertController(title:nil, message: "Chosse Apperances", preferredStyle: .alert)
        let alertLight = UIAlertAction(title: "Light", style: .default) {action in
            self.main_tvApperances.text = "Light Mode"
            self.apperancesMode(apperances: "Light")
        }
        let alertDark = UIAlertAction(title: "Dark", style: .default){action in
            self.main_tvApperances.text = "Dark Mode"
            self.apperancesMode(apperances: "Dark")
        }
        alert.addAction(alertLight)
        alert.addAction(alertDark)
        self.present(alert, animated: true)
    }
    
    //Function For Apperances Mode
    func apperancesMode(apperances:String){
        if(apperances == "Dark"){
            overrideUserInterfaceStyle = .dark
        }else{
            overrideUserInterfaceStyle = .light
        }
        UserDefaults.standard.set(apperances, forKey: "ApperanceMode")
    }
}

