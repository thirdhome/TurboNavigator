import Turbo
import UIKit

public extension VisitProposal {
    var context: Navigation.Context {
        if let rawValue = properties["context"] as? String {
            return Navigation.Context(rawValue: rawValue) ?? .default
        }
        return .default
    }

    var presentation: Navigation.Presentation {
        if let rawValue = properties["presentation"] as? String {
            return Navigation.Presentation(rawValue: rawValue) ?? .default
        }
        return .default
    }

    var enableBackButton: Bool {
        properties["enable_back_button"] as? Bool ?? true
    }    

    /// Used to identify a custom native view controller if provided in the path configuration properties of a given pattern.
    ///
    /// For example, given the following configuration file:
    ///
    /// ```
    /// {
    ///   "rules": [
    ///     {
    ///       "patterns": [
    ///         "/recipes/*"
    ///       ],
    ///       "properties": {
    ///         "view-controller": "recipes",
    ///       }
    ///     }
    ///  ]
    /// }
    /// ```
    ///
    /// A VisitProposal to `https://example.com/recipes/` will have `proposal.viewController == "recipes"`
    ///
    /// A default value is provided in case the view controller property is missing from the configuration file. This will route the default `VisitableViewController`.
    var viewController: String {
        if let viewController = properties["view-controller"] as? String {
            return viewController
        }

        return VisitableViewController.pathConfigurationIdentifier
    }
}
