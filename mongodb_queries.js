// Use database
use nimbus_events;

// View sample data
db.user_activity_logs.find().limit(5);

// Count total records
db.user_activity_logs.countDocuments();

// Top actions
db.user_activity_logs.aggregate([
  {
    $group: {
      _id: "$action",
      count: { $sum: 1 }
    }
  },
  {
    $sort: { count: -1 }
  }
]);

// Most active users
db.user_activity_logs.aggregate([
  {
    $group: {
      _id: "$userId",
      total_actions: { $sum: 1 }
    }
  },
  {
    $sort: { total_actions: -1 }
  },
  {
    $limit: 10
  }
]);