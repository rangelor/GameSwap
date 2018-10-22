import UIKit

protocol DataEnteredDelegate {
    func userDidEnterInformation(info: String)
}

class AddAGameViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var dataTextField: UITextField!
    
    var delegate: DataEnteredDelegate? = nil
    
    var autocompletePossibilities = ["Fortnite", "Persona 5", "Call of Duty: Modern Warfare 2"]
    var autoCompleteCharacterCount = 0
    var timer = Timer()

    
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
    
    
    func textField(_ dataTextField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { //1
        var subString = (dataTextField.text!.capitalized as NSString).replacingCharacters(in: range, with: string) // 2
        subString = formatSubstring(subString: subString)
        
        if subString.count == 0 { // 3 when a user clears the textField
            resetValues()
        } else {
            searchAutocompleteEntriesWithSubstring(substring: subString) //4
        }
        return true
    }
    
    func formatSubstring(subString: String) -> String {
        let formatted = String(subString.dropLast(autoCompleteCharacterCount)).lowercased().capitalized //5
        return formatted
    }
    
    func searchAutocompleteEntriesWithSubstring(substring: String) {
        let userQuery = substring
        let suggestions = getAutocompleteSuggestions(userText: substring) //1
        
        if suggestions.count > 0 {
            timer = .scheduledTimer(withTimeInterval: 0.01, repeats: false, block: { (timer) in //2
                let autocompleteResult = self.formatAutocompleteResult(substring: substring, possibleMatches: suggestions) // 3
                self.putColourFormattedTextInTextField(autocompleteResult: autocompleteResult, userQuery : userQuery) //4
                self.moveCaretToEndOfUserQueryPosition(userQuery: userQuery) //5
            })
        } else {
            timer = .scheduledTimer(withTimeInterval: 0.01, repeats: false, block: { (timer) in //7
                self.dataTextField.text = substring
            })
            autoCompleteCharacterCount = 0
        }
    }
    
    func getAutocompleteSuggestions(userText: String) -> [String]{
        var possibleMatches: [String] = []
        for item in autocompletePossibilities { //2
            let myString:NSString! = item as NSString
            let substringRange :NSRange! = myString.range(of: userText)
            
            if (substringRange.location == 0)
            {
                possibleMatches.append(item)
            }
        }
        return possibleMatches
    }
    
    func putColourFormattedTextInTextField(autocompleteResult: String, userQuery : String) {
        let colouredString: NSMutableAttributedString = NSMutableAttributedString(string: userQuery + autocompleteResult)
        colouredString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green, range: NSRange(location: userQuery.count,length:autocompleteResult.count))
        self.dataTextField.attributedText = colouredString
    }
    
    func moveCaretToEndOfUserQueryPosition(userQuery : String) {
        if let newPosition = self.dataTextField.position(from: self.dataTextField.beginningOfDocument, offset: userQuery.count) {
            self.dataTextField.selectedTextRange = self.dataTextField.textRange(from: newPosition, to: newPosition)
        }
        let selectedRange: UITextRange? = dataTextField.selectedTextRange
        dataTextField.offset(from: dataTextField.beginningOfDocument, to: (selectedRange?.start)!)
    }
    
    func formatAutocompleteResult(substring: String, possibleMatches: [String]) -> String {
        var autoCompleteResult = possibleMatches[0]
        autoCompleteResult.removeSubrange(autoCompleteResult.startIndex..<autoCompleteResult.index(autoCompleteResult.startIndex, offsetBy: substring.count))
        autoCompleteCharacterCount = autoCompleteResult.count
        
        return autoCompleteResult
    }
    
    func resetValues() {
        autoCompleteCharacterCount = 0
        dataTextField.text = ""
    }
    
    func textFieldShouldReturn(_ dataTextField: UITextField) -> Bool {
        //        dataTextField.resignFirstResponder()  //if desired
        confirmAutoComplete(dataTextField)
        return true
}

    func confirmAutoComplete(_ dataTextField: UITextField){
        dataTextField.textColor = UIColor.black
}

}
