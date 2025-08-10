import Foundation
import DeviceActivity
import FamilyControls
import Capacitor

@objc public class ScreenTimePlugin: CAPPlugin {

    @objc public func enableScreenTimeAccess(_ call: CAPPluginCall) {
        FamilyControls.requestAuthorization { (status, error) in
            if status == .authorized {
                call.resolve()
            } else {
                call.reject("Failed to authorize", error?.localizedDescription)
            }
        }
    }

    @objc public func setAppLimit(_ call: CAPPluginCall) {
        guard let appIdentifier = call.getString("appIdentifier"),
              let limit = call.getDouble("limit") else {
            call.reject("Missing parameters")
            return
        }
        
        let appLimit = DeviceActivityAppLimit(identifier: appIdentifier, dailyLimit: limit)
        FamilyControls.shared.setAppLimit(appLimit) { error in
            if let error = error {
                call.reject("Failed to set app limit", error.localizedDescription)
            } else {
                call.resolve()
            }
        }
    }

    @objc public func getAppUsage(_ call: CAPPluginCall) {
        guard let appIdentifier = call.getString("appIdentifier") else {
            call.reject("Missing app identifier")
            return
        }

        DeviceActivity.fetchAppUsage(identifier: appIdentifier) { (usage, error) in
            if let usage = usage {
                call.resolve(["usage": usage])
            } else {
                call.reject("Failed to fetch app usage", error?.localizedDescription)
            }
        }
    }
}
