import XCTest
@testable import PhoenixKitsuSiteAnnouncements

class SiteAnnouncementTests: XCTestCase {
  let decoder = JSONDecoder()
  
  let fullyFilledJSON: [String : Any] = [
    "id" : "4",
    "type" : "siteAnnouncements",
    "links" : [
      "self" : "https://kitsu.io/api/edge/site-announcements/4"
    ],
    "attributes" : [
      "createdAt" : "2017-08-08T12:39:19.217Z",
      "updatedAt" : "2017-08-08T12:39:19.217Z",
      "title": "It's update time!",
      "description": "A new release is upon us.",
      "imageUrl": "https://media.giphy.com/media/3og0IEXRvwMN0cLSaQ/giphy.gif",
      "link": "https://medium.com/heykitsu/kitsu-release-notes-may-11th-2017-803bacc10e34"
    ]
  ]

  let validMissingDataJSON: [String : Any] = [
    "id" : "4",
    "type" : "siteAnnouncements",
    "links" : [
      "self" : "https://kitsu.io/api/edge/site-announcements/4"
    ],
    "attributes" : [
      "createdAt" : "2017-08-08T12:39:19.217Z",
      "updatedAt" : "2017-08-08T12:39:19.217Z",
      "title": "It's update time!"
    ]
  ]
  
  let validNilDataJSON: [String : Any] = [
    "id" : "4",
    "type" : "siteAnnouncements",
    "links" : [
      "self" : "https://kitsu.io/api/edge/site-announcements/4"
    ],
    "attributes" : [
      "createdAt" : "2017-08-08T12:39:19.217Z",
      "updatedAt" : "2017-08-08T12:39:19.217Z",
      "title": "It's update time!",
      "description": nil,
      "imageUrl": nil,
      "link": nil
    ]
  ]

  let invalidMissingDataJSON: [String : Any] = [
    "id" : "4",
    "type" : "siteAnnouncements",
    "links" : [
      "self" : "https://kitsu.io/api/edge/site-announcements/4"
    ],
    "attributes" : [
      "title": "It's update time!",
      "description": "A new release is upon us.",
      "imageUrl": "https://media.giphy.com/media/3og0IEXRvwMN0cLSaQ/giphy.gif",
      "link": "https://medium.com/heykitsu/kitsu-release-notes-may-11th-2017-803bacc10e34"
    ]
  ]
  
  let invalidNilDataJSON: [String : Any?] = [
    "id" : "4",
    "type" : "siteAnnouncements",
    "links" : [
      "self" : "https://kitsu.io/api/edge/site-announcements/4"
    ],
    "attributes" : [
      "createdAt" : nil,
      "title": "It's update time!",
      "description": "A new release is upon us.",
      "imageUrl": "https://media.giphy.com/media/3og0IEXRvwMN0cLSaQ/giphy.gif",
      "link": "https://medium.com/heykitsu/kitsu-release-notes-may-11th-2017-803bacc10e34"
    ]
  ]

  var siteAnnouncement: SiteAnnouncement?
  var siteAnnouncementAttributes: SiteAnnouncementAttributes?

  override func tearDown() {
    self.siteAnnouncement = nil
    self.siteAnnouncementAttributes = nil

    super.tearDown()
  }

  func testSiteAnnouncementFullyFilled() {
    let json = self.fullyFilledJSON

    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      siteAnnouncement = try? decoder.decode(SiteAnnouncement.self, from: data!)
    } else {
      siteAnnouncement = nil
    }
    siteAnnouncementAttributes = siteAnnouncement?.attributes

    XCTAssertNotNil(self.siteAnnouncement)

    XCTAssertEqual(self.siteAnnouncement?.objectID, "4")
    XCTAssertEqual(self.siteAnnouncement?.type, "siteAnnouncements")

    XCTAssertNotNil(self.siteAnnouncementAttributes)
    
    XCTAssertEqual(self.siteAnnouncementAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(self.siteAnnouncementAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(self.siteAnnouncementAttributes?.title, "It's update time!")
    XCTAssertEqual(self.siteAnnouncementAttributes?.description, "A new release is upon us.")

    let testImageURL = "https://media.giphy.com/media/3og0IEXRvwMN0cLSaQ/giphy.gif"
    XCTAssertEqual(self.siteAnnouncementAttributes?.imageURL, testImageURL)

    let testLink = "https://medium.com/heykitsu/kitsu-release-notes-may-11th-2017-803bacc10e34"
    XCTAssertEqual(self.siteAnnouncementAttributes?.link, testLink)
  }

  func testSiteAnnouncementValidMissingData() {
    let json = self.validMissingDataJSON

    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      siteAnnouncement = try? decoder.decode(SiteAnnouncement.self, from: data!)
    } else {
      siteAnnouncement = nil
    }
    siteAnnouncementAttributes = siteAnnouncement?.attributes
    
    XCTAssertNotNil(self.siteAnnouncement)
    
    XCTAssertEqual(self.siteAnnouncement?.objectID, "4")
    XCTAssertEqual(self.siteAnnouncement?.type, "siteAnnouncements")
    
    XCTAssertNotNil(self.siteAnnouncementAttributes)
    
    XCTAssertEqual(self.siteAnnouncementAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(self.siteAnnouncementAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(self.siteAnnouncementAttributes?.title, "It's update time!")
    XCTAssertNil(self.siteAnnouncementAttributes?.description)
    XCTAssertNil(self.siteAnnouncementAttributes?.imageURL)
    XCTAssertNil(self.siteAnnouncementAttributes?.link)
  }

  func testSiteAnnouncementValidNilData() {
    let json = self.validNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      siteAnnouncement = try? decoder.decode(SiteAnnouncement.self, from: data!)
    } else {
      siteAnnouncement = nil
    }
    siteAnnouncementAttributes = siteAnnouncement?.attributes
    
    XCTAssertNotNil(self.siteAnnouncement)
    
    XCTAssertEqual(self.siteAnnouncement?.objectID, "4")
    XCTAssertEqual(self.siteAnnouncement?.type, "siteAnnouncements")
    
    XCTAssertNotNil(self.siteAnnouncementAttributes)
    
    XCTAssertEqual(self.siteAnnouncementAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(self.siteAnnouncementAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(self.siteAnnouncementAttributes?.title, "It's update time!")
    XCTAssertNil(self.siteAnnouncementAttributes?.description)
    XCTAssertNil(self.siteAnnouncementAttributes?.imageURL)
    XCTAssertNil(self.siteAnnouncementAttributes?.link)
  }

  func testSiteAnnouncementInvalidMissingData() {
    let json = self.invalidMissingDataJSON

    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      siteAnnouncement = try? decoder.decode(SiteAnnouncement.self, from: data!)
    } else {
      siteAnnouncement = nil
    }
    siteAnnouncementAttributes = siteAnnouncement?.attributes
    
    XCTAssertNotNil(self.siteAnnouncement)
    
    XCTAssertEqual(self.siteAnnouncement?.objectID, "4")
    XCTAssertEqual(self.siteAnnouncement?.type, "siteAnnouncements")
    
    XCTAssertNil(self.siteAnnouncementAttributes)
  }
  
  func testSiteAnnouncementInvalidNilData() {
    let json = self.invalidNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      siteAnnouncement = try? decoder.decode(SiteAnnouncement.self, from: data!)
    } else {
      siteAnnouncement = nil
    }
    siteAnnouncementAttributes = siteAnnouncement?.attributes
    
    XCTAssertNotNil(self.siteAnnouncement)
    
    XCTAssertEqual(self.siteAnnouncement?.objectID, "4")
    XCTAssertEqual(self.siteAnnouncement?.type, "siteAnnouncements")
    
    XCTAssertNil(self.siteAnnouncementAttributes)
  }
}
