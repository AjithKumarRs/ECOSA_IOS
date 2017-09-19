//
//  SecondViewController.swift
//  web
//
//  Created by Gerve-Endy Pluviose on 6/1/17.
//  Copyright © 2017 Gerve-Endy Pluviose. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var TitleText: UILabel!

    @IBOutlet weak var WebView: UIWebView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myContent = Contents[date]
        let myTitle = Titles[date]
        
        TitleText.text = myTitle;
        
        
        let myURL = URL( string:"http://sabbathschoollessons.blogspot.com")!;
        
        let htmlHeader = "<html> \n <head> \n <link href=\"thecss.css\" rel=\"stylesheet\" type=\"text/css\" /> \n </head> \n <body> \(myContent)\n"
    
        let htmlFooter = "</body> \n </html>"
        
        let baseURLForCss = Bundle.main.url(forResource: "thecss", withExtension: "css")
        
        //webView.loadHTMLString(String.init(format: "%@%@&@", htmlHeader, htmlSnippet, htmlFooter), baseURL: baseURLForCss)
        //WebView.loadHTMLString(myContent, baseURL: myURL)
                
        WebView.loadHTMLString(String.init(format: "%@%@&@", htmlHeader, htmlFooter), baseURL: baseURLForCss)

        

        // Do any additional setup after loading the view.
    }
    @IBAction func goBack(_ sender: Any) {
        //[WebView .goBack()];
        viewDidLoad();
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
