# Kobe Code Challenge - iOS

This code is for a challenge proposed by Kobe.

### Requirements

What you need to run this project:

* Xcode 10.1
* [CocoaPods - Installation Guide](https://guides.cocoapods.org/using/getting-started.html)

### Installing instructions

```bash
sudo gem install cocoapods
git clone https://github.com/liuvasconcelos/kobe-ios-challenge.git
git checkout develop
pod install
open kobe-ios-challenge.xcworkspace/
```

## Running instructions

CMD + R to run the project.

CMD + U to run tests.

## Comments
 
This project consists on an iOS application that search for top rated films from TMDb API (https://www.themoviedb.org/). When app is opened, it shows the 20 first top rated movies, according to The Movie DB. When user scroll it down, it is paginated to show as many films as API could provide. In this first interaction, it is also possible to search movies by name. 
Clicking in one of the cells, app shows more details of that movie with overview and a bigger image of poster.
It was made using MVP architecture to avoid view controller growth and separate responsibilities. It was also projected to be coded programmaticaly. Design was inspiraded on others movies apps and iOS 13 dark mode. For API consumption, it was choose to work with native requests, usings Codable/Decodable protocols. It is also adapted to run in iOS 13 iPhones, with modal presentation style of navigation and has translation for portuguese and english.
For tests, I was choosen to prioritize integration tests, but on iOS 13 some I could not do it. So, for this cases, I was choosen to do unit tests. 

## Libraries Used
 
 It was choosen to use OHHTPStubs/Swift lib to mock API responses on tests. This choise was made to make it possible to test some cenariums of API errors and success responses.

## Screenshots
![](https://github.com/liuvasconcelos/kobe-ios-challenge/blob/develop/Screenshots/1-top-rated-movies.png) ![](https://github.com/liuvasconcelos/kobe-ios-challenge/blob/develop/Screenshots/2-movie-details.png)
