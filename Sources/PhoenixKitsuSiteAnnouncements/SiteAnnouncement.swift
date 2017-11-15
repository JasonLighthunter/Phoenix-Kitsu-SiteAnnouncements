//
//  SiteAnnouncement.swift
//  Phoenix-Kitsu-SiteAnnouncements
//
//  Created by Job Cuppen on 15/11/2017.

import PhoenixKitsuCore

public class SiteAnnouncement: KitsuObject {
  public static var requestURLString = "site-announcements"

  public let objectID: String
  public let type: String
  public let links: Links
  public private(set) var attributes: SiteAnnouncementAttributes?

  private enum CodingKeys: String, CodingKey {
    case objectID = "id"
    case type
    case links
    case attributes
  }
}

public class SiteAnnouncementAttributes: KitsuObjectAttributesWithTimestamp {
  public let createdAt: String
  public let updatedAt: String
  public let title: String
  public let description: String?
  public private(set) var imageURL: String?
  public private(set) var link: String?

  private enum CodingKeys: String, CodingKey {
    case createdAt
    case updatedAt
    case title
    case description
    case imageURL = "imageUrl"
    case link
  }
}
