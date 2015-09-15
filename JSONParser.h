//
//  JSONParser.h
//  HotelManager
//
//  Created by MICK SOUMPHONPHAKDY on 9/12/15.
//  Copyright (c) 2015 MICK SOUMPHONPHAKDY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONParser : NSObject

@end



//  class JSONParser {
//    
//    class func userJSONParser(jsonData : NSData) -> [User]? {
//      if let rootObject = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: nil) as? [String : AnyObject],
//        items = rootObject["items"] as? [[String : AnyObject]] {
//          var users = [User]()
//          for item in items {
//            if let login = item["login"] as? String,
//              id = item["id"] as? Int,
//              avatarURL = item["avatar_url"] as? String{
//                let user = User(login : login, avatarURL : avatarURL, id: "\(id)", image : nil)
//                users.append(user)
//              }
//          }
//          return users
//        }
//      return nil
//    }
//    
//    class func repoJSONParser(jsonData : NSData) -> [Repository]? {
//      if let rootObject = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: nil) as? [String : AnyObject],
//        items = rootObject["items"] as? [[String : AnyObject]] {
//          var repos = [Repository]()
//          for item in items {
//            if let name = item["name"] as? String,
//              let ownerDictionary = item["owner"] as? [String : AnyObject],
//              let owner = ownerDictionary["login"] as? String,
//              let url = ownerDictionary["url"] as? String,
//              let avatarURL = ownerDictionary["avatar_url"] as? String,
//              let htmlURL = ownerDictionary["html_url"] as? String{
//                let repo = Repository(name: name, owner: owner, url: url, avatarUrl: avatarURL, htmlURL: htmlURL, image: nil)
//                repos.append(repo)
//              }
//          }
//          return repos
//        }
//      return nil
//    }
//    
//  }



/*
 
 let name : String
 let owner : String
 let url : String
 let avatarUrl : String
 var image : UIImage?
 
 {
 "total_count": 40,
 "incomplete_results": false,
 "items": [
 {
 "id": 3081286,
 "name": "Tetris",
 "full_name": "dtrupenn/Tetris",
 "owner": {
 "login": "dtrupenn",
 "id": 872147,
 "avatar_url": "https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
 "gravatar_id": "",
 "url": "https://api.github.com/users/dtrupenn",
 "received_events_url": "https://api.github.com/users/dtrupenn/received_events",
 "type": "User"
 },
 "private": false,
 "html_url": "https://github.com/dtrupenn/Tetris",
 "description": "A C implementation of Tetris using Pennsim through LC4",
 "fork": false,
 "url": "https://api.github.com/repos/dtrupenn/Tetris",
 "created_at": "2012-01-01T00:31:50Z",
 "updated_at": "2013-01-05T17:58:47Z",
 "pushed_at": "2012-01-01T00:37:02Z",
 "homepage": "",
 "size": 524,
 "stargazers_count": 1,
 "watchers_count": 1,
 "language": "Assembly",
 "forks_count": 0,
 "open_issues_count": 0,
 "master_branch": "master",
 "default_branch": "master",
 "score": 10.309712
 }
 ]
 }
 
 {
 "total_count": 12,
 "incomplete_results": false,
 "items": [
 {
 "login": "mojombo",
 "id": 1,
 "avatar_url": "https://secure.gravatar.com/avatar/25c7c18223fb42a4c6ae1c8db6f50f9b?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
 "gravatar_id": "",
 "url": "https://api.github.com/users/mojombo",
 "html_url": "https://github.com/mojombo",
 "followers_url": "https://api.github.com/users/mojombo/followers",
 "subscriptions_url": "https://api.github.com/users/mojombo/subscriptions",
 "organizations_url": "https://api.github.com/users/mojombo/orgs",
 "repos_url": "https://api.github.com/users/mojombo/repos",
 "received_events_url": "https://api.github.com/users/mojombo/received_events",
 "type": "User",
 "score": 105.47857
 }
 ]
 }
 
 */