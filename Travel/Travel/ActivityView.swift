import SwiftUI
import FoundationModels

struct ActivityView: View {
    
    let activity: Activity.PartiallyGenerated
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            if let title = activity.title {
                Text(title)
                    .font(.headline)
                    
            }
            
            if let activityType = activity.type {
                Text(activityType.rawValue.capitalized)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
            }
            
            if let description = activity.description {
                Text(description)
                    .font(.body)
                    
            }
        }
        .frame(width: 300)
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}

#Preview {
    ActivityView(activity: Activity.preview)
}

