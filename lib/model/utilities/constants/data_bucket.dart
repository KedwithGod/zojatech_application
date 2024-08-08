// to let the notification now what page to go back to

import '../imports/general_import.dart';

String? notificationBackBucket;
String? resetPasswordEmailBucket;
String? initialRouteBucket;

// to know where each page came from, so the back button can take them there

String? backButtonRedirectBucket;

bool? isLoggedInBucket;
List? repaymentScheduleListBucket;

double progressBucket = 0.0;
int perPageBucket = 5;
