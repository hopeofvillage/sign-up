//
//  secondViewController.swift
//  login2
//
//  Created by macos-10.13 on 2018/8/1.
//  Copyright © 2018年 macos-10.13. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
   var dictdata = [String : String]()
    @IBOutlet weak var phonenumTF: UITextField!
    @IBOutlet weak var checknumTF: UITextField!
    @IBOutlet weak var pwdnumTF: UITextField!
    
    
    @IBAction func cknumButton(_ sender: UIButton) {
        let url:NSURL! = NSURL(string: "http://192.168.31.7:9090/cdz/api/do.jhtml?router=appApiService.getSmsCode")
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL)
        let list  = NSMutableArray()
        //var paramDic = [String: String]()
        var phone = phonenumTF.text
        
        
        
        if phone == nil{
            
        }else{
            let paramDic:[String : String] = ["phone": phone ?? " ","type":"1"]
            
            
            
            if paramDic.count >= 0 {
                //设置为POST请求
                request.httpMethod = "POST"
                //拆分字典,subDic是其中一项，将key与value变成字符串
                for subDic in paramDic {
                    let tmpStr = "\(subDic.0)=\(subDic.1)"
                    list.add(tmpStr)
                }
                
                //用&拼接变成字符串的字典各项
                
                let paramStr = list.componentsJoined(by: "&")
                //UTF8转码，防止汉字符号引起的非法网址
                let paraData = paramStr.data(using: String.Encoding.utf8)
                //设置请求体
                request.httpBody = paraData
            }
            //默认session配置
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            //发起请求
            let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
                
                //            let str:String! = String(data: data!, encoding: NSUTF8StringEncoding)
                //            print("str:\(str)")
                //转Json
                let jsonData:NSDictionary = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
                
                print(jsonData)
                //print(jsonData["smsSessionId"])
                self.dictdata = jsonData as! [String : String]
               // self.dictdata["role"] = "1"
                //print(self.dictdata["smsSessionId"])
            }
            //请求开始
            dataTask.resume()
        }
    }
    
    
    @IBAction func confirmButton(_ sender: UIButton) {
        let url1:NSURL! = NSURL(string: "http://192.168.31.7:9090/cdz/api/do.jhtml?router=appApiService.forgetPwd")
        let request1:NSMutableURLRequest = NSMutableURLRequest(url: url1 as URL)
        let list1  = NSMutableArray()
        //var paramDic = [String: String]()
        var phone = phonenumTF.text
        var checknumber = checknumTF.text
        var password = pwdnumTF.text
        
        if phone == nil{
            
        }else{
            let paramDic:[String : String] = ["phone": phone ?? " ","newPwd":pwdnumTF.text ?? "","smsCode":checknumber ?? "","smsSessionId":dictdata["smsSessionId"] ?? ""]
            
            
            
            if paramDic.count >= 0 {
                //设置为POST请求
                request1.httpMethod = "POST"
                //拆分字典,subDic是其中一项，将key与value变成字符串
                for subDic in paramDic {
                    let tmpStr = "\(subDic.0)=\(subDic.1)"
                    list1.add(tmpStr)
                }
                
                //用&拼接变成字符串的字典各项
                
                let paramStr = list1.componentsJoined(by: "&")
                //UTF8转码，防止汉字符号引起的非法网址
                let paraData = paramStr.data(using: String.Encoding.utf8)
                //设置请求体
                request1.httpBody = paraData
            }
            //默认session配置
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            //发起请求
            let dataTask = session.dataTask(with: request1 as URLRequest) { (data, response, error) in
                
                //            let str:String! = String(data: data!, encoding: NSUTF8StringEncoding)
                //            print("str:\(str)")
                //转Json
                let jsonData:NSDictionary = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
                
                print(jsonData)
                
            }
            //请求开始
            dataTask.resume()
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
