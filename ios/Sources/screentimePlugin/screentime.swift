import Foundation

@objc public class screentime: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
