# CampaignOrdersList Padding Fix

## Issue
The `CampaignOrdersList` widget was missing bottom padding, causing list items to extend all the way to the bottom edge of the screen without proper spacing.

## Solution
Updated the padding in `CampaignOrdersList` from:
```dart
padding: EdgeInsets.symmetric(horizontal: 20.r)
```

To:
```dart
padding: EdgeInsets.fromLTRB(20.r, 0.r, 20.r, 25.r)
```

## Benefits
- Maintains existing horizontal padding of 20.r
- Adds 25.r bottom padding to prevent list items from appearing cut off
- Ensures consistent spacing pattern with other listing screens like `ProductListingScreen`
- Improves user experience with better visual spacing

## Files Changed
- `lib/screens/campaign/widgets/campaign_dashboard_widgets.dart` - Updated padding in CampaignOrdersList widget

## Testing
The change has been tested to ensure:
- Horizontal padding remains unchanged (20.r on left and right)
- Bottom padding is now 25.r
- List items no longer extend to the bottom edge
- Consistent spacing with other screens in the app