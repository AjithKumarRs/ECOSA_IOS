//
//  ViewController.swift
//  web
//
//  Created by Gerve-Endy Pluviose on 5/23/17.
//  Copyright © 2017 Gerve-Endy Pluviose. All rights reserved.
//

import UIKit
import CoreData

var date = Int()
var Contents: [String] = [];
var Titles: [String] = [];
var LoadCheck = 0


class ViewController: UIViewController, NSFetchedResultsControllerDelegate {
    
        var managedObjectContext: NSManagedObjectContext? = nil


    override func viewDidLoad() {
        super.viewDidLoad()
        LoadCheck = LoadCheck + 1
        
        if LoadCheck <= 1 {
            LoadData();
        } else {
            ShowBut();
        }
        
    

    
}
        
  
    func LoadData() {
        
        //let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        let fr = NSURL(string:"https://www.googleapis.com/blogger/v3/blogs/7179108021148482862/posts?key=AIzaSyA9BbZbLcAJgndf65y3K8FIrmtHr8ey0P0")!;
        
        let sp = NSURL(string:"https://www.googleapis.com/blogger/v3/blogs/5772307615199315583/posts?key=AIzaSyA9BbZbLcAJgndf65y3K8FIrmtHr8ey0P0")!;
        
        let eng = NSURL(string:"https://www.googleapis.com/blogger/v3/blogs/300098307780425528/posts?key=AIzaSyA9BbZbLcAJgndf65y3K8FIrmtHr8ey0P0")!;
        
        let request = URLRequest(url: fr as URL);
        
        let url = request;
        
        let session = URLSession.shared;
        
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                //print(error)
                
            } else{
                
                if let data = data {
                    
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                        
                        
                        
                        
                        
                        if jsonResult.count > 0 {
                            if let items = jsonResult["items"] as? NSArray {
                                
                                
                                //                                let dict:[String:String] = ["key":"Hello"]
                                //                                UserDefaults.standard.set(dict, forKey: "dict")
                                //                                let result = UserDefaults.standard.value(forKey: "dict")
                                //                                print(result!)
                                
                                UserDefaults.standard.set(items, forKey: "array") ;
                                
                                
                                //                                for item in items
                                  print(items);
                                
                                
                            }
                        }
                        
                        
                    } catch{}
                }
                
            }
            
            
        })
        task.resume()
        
        
        
        
        //showContent();
        GetDeta();
        
        
        
        
    }
    
    
    func GetDeta() {
        
        let items = UserDefaults.standard.value(forKey: "array")! as! NSArray
        
        for i in 0...6{
            if let title = (items[i] as AnyObject)["title"] as? String {
                Titles.insert(title, at: i)
                
            }
            
            if let Con = (items[i] as AnyObject)["content"] as? String {
                Contents.insert(Con, at: i)
                
            }
            
            
        }
        
        ShowBut();

        
    }
    
    
    
    @IBOutlet weak var One: UIButton!
        
    @IBOutlet weak var Two: UIButton!
    
    @IBOutlet weak var Three: UIButton!
    
    func ShowBut() {
        One.setTitle(Titles[1], for: .normal)
        Two.setTitle(Titles[2], for: .normal)
    }
    
    @IBAction func OneInfo(_ sender: Any) {
        date = 1
    }
    @IBAction func TwoInfo(_ sender: Any) {
        date = 2
    }
    
    
    @IBAction func refresh(_ sender: Any) {
        LoadCheck = 0
        LoadData()
        
        
    }
    
    
    
//    func showContent(){
//        
//        let items = UserDefaults.standard.object(forKey: "array")! as! NSArray
//        
//        let day = 2
//        
//        if let me = (items[day] as AnyObject)["content"] as? String {
//            
//            print(me)
//            TextField.text = me;
//        }
//        
//        
//        
//    }
    
        
        
        
        
//        for item in items {
//            print("Hello")
//            
//            
//            //print((item as AnyObject)["title"])
//            if let title = (item as AnyObject)["title"] as? String{
//                // print("working")
//                
//                if let content = (item as AnyObject)["content"] as? String {
////                    print(title)
////                    print(content)
//                    
//                    print("\n\n\n\n -----------------")
//                }
//            }
//        }
    //} extra
    
   
    //                                let result = UserDefaults.standard.value(forKey: "dict")
    //                                print(result!)
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secController = segue.destination as! SecondViewController
        
       // let myURL = URL( string:"http://sabbathschoollessons.blogspot.com")!;
        
        let items = UserDefaults.standard.value(forKey: "array")! as! NSArray
        
        let day = 2
        
        if let title = (items[day] as AnyObject)["title"] as? String {
            secController.myTitle = title;
        
        }
        if let me = (items[day] as AnyObject)["content"] as? String {
            print("-----")
            
            
            
            
            //let head = " <link rel=\"stylesheet\" type=\"text/css\" href=\"thecss.css\"> ";
            
            
           // let sendIT = "<html><head> <link rel=\"stylesheet\" type=\"text/css\" href=\"thecss.css\"> </head><body>\(head)\(me)</body></html>";
            //print(me)
            
            
            secController.myContent = me;
        }
        
        
        
        
    }
    
    */
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

