import PhoenixKitsuCore
import Requestable

public class SiteAnnouncement: KitsuObject<SiteAnnouncementAttributes>, Requestable {
  public static var requestURLString = "site-announcements"
}

public class SiteAnnouncementAttributes: KitsuObjectAttributesWithTimestamp {
  public let createdAt: String
  public let updatedAt: String
  public let title: String
  public let description: String?
  public let imageURL: String?
  public let link: String?

  private enum CodingKeys: String, CodingKey {
    case createdAt
    case updatedAt
    case title
    case description
    case imageURL = "imageUrl"
    case link
  }
}
