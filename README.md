# social_network_system_design
This project presents the System Design of a social network for the System Design course.

# Functional requirements

1. User registration
2. Support user online/offline status
3. Creating and editing a user profile
4. Adding and removing other users as friends
5. Viewing and publishing posts
6. Adding media files to posts
7. View other users' posts
8. Sending messages by user
9. Support for text and media files in messages
10. Receiving messages by the user
11. Create a chat for communication between several users
12. View all user dialogues and chats


# Non-functional requirements

1. DAU - 47 600 000
2. MAU - 72 000 000
3. Response time for sending messages - 1 s
4. Response time for receiving messagae - 3 s
5. Response time for sending data (posts/media) - 5 s
6. Response time for receiving data (posts/media) - 10 s
7. Max length for messages - 1000 symbols
8. Max length for posts - 1000 symbols
9. We support only users from the CIS
10. Storage period for messages and all undeleted user data - 5 years
11. Avarage reading messages for user 20 per day
12. Avarage sending messages for user 5 per day
13. Avarage reading posts for user 10 per day
14. Avarage sending posts for user 0,2 per day

# Service for massages:

RPS (read) = 47 600 000 * 20 / 86 400 = 11 019
RPS (write) = 11 019 / 4 = 2 755

Traffic per second (write) = 2 755 * 2000 = 6 mb/s
Traffic per day (write) = 6 * 86 400 = 518 gb/s
Traffic per year (write) = 518 * 365 = 189 tb/s
Initial storage capacity (5 years) = 945 TB
Initial storage capacity with replications and backups (5 years) = 945 * 2,5 = 2 PB

SSD = 6 TB
HDD = 6 TB
Number of HDD with replications and backups = 334
Number of HDD for 1 replica = 134
Number of shards = 24 shards with 2 replicas and 1 backup

# Service for posts:
RPS (read) = 47 600 000 * 10 / 86 400 = 5 509
RPS (write) = 5 509 / 50 = 110

Traffic per second (write) = 110 * 2000 = 220 kb/s
Traffic per day (write) = 220 * 86 400 = 19 gb/s
Traffic per year (write) = 19 * 365 = 7 tb/s
Initial storage capacity (5 years) = 35 TB
Initial storage capacity with replications and backups (5 years) = 35 * 2,5 = 88 TB

SSD = 6 TB
HDD = 6 TB
Number of HDD with replications and backups = 15
Number of HDD for 1 replica = 6 
Number of shards = 1 shard with 2 replicas and 1 backup



# List of services:
1. Users
2. Forms
3. Massages
4. Posts
5. Likes
6. Relations
7. Medias


