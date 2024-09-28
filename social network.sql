/* 
Replication:
- master-slave (one sync + async)
- replication factor 3

Sharding:
- Key based by id
*/
  

CREATE TABLE "relations" (
  "following_user_id" integer,
  "followed_user_id" integer,
  "status" enum,
  "created_at" timestamp
);

CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "username" varchar,
  "role" varchar,
  "created_at" timestamp
);

CREATE TABLE "messages" (
  "id" integer PRIMARY KEY,
  "sender_id" integer,
  "recipient_id" integer,
  "text" varchar,
  "chat_id" integer,
  "status" enum,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "chats" (
  "id" integer PRIMARY KEY,
  "status" enum,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "chat_partisipants" (
  "id" integer PRIMARY KEY,
  "chat_id" integer,
  "user_id" integer,
  "created_at" timestamp
);

CREATE TABLE "posts" (
  "id" integer PRIMARY KEY,
  "title" varchar,
  "body" text,
  "user_id" integer,
  "status" enum,
  "tags" integer,
  "likes" integer,
  "views" integer,
  "comments" integer,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "post_medias" (
  "id" integer PRIMARY KEY,
  "post_id" integer,
  "media_id" integer,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "medias" (
  "id" integer PRIMARY KEY,
  "title" varchar,
  "file_type" enum,
  "file" integer,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "post_tags" (
  "id" integer PRIMARY KEY,
  "post_id" integer,
  "tag" varchar,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "post_likes" (
  "id" integer PRIMARY KEY,
  "post_id" integer,
  "user_id" integer,
  "created_at" timestamp
);

CREATE TABLE "post_views" (
  "id" integer PRIMARY KEY,
  "post_id" integer,
  "user_id" integer,
  "created_at" timestamp
);

CREATE TABLE "post_comments" (
  "id" integer PRIMARY KEY,
  "post_id" integer,
  "body" varchar,
  "author" integer,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "forms" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "Descrition" text,
  "Photo" integer,
  "City" varchar,
  "Interests" varchar,
  "created_at" timestamp,
  "updated_at" timestamp
);

COMMENT ON COLUMN "relations"."status" IS 'friends, lovers, followers';

COMMENT ON COLUMN "messages"."status" IS 'read, unread';

COMMENT ON COLUMN "chats"."status" IS 'read, unread';

COMMENT ON COLUMN "posts"."body" IS 'Content of the post';

COMMENT ON COLUMN "medias"."file_type" IS 'video, photo, audio, image';

COMMENT ON COLUMN "medias"."file" IS 'link to S3';

COMMENT ON COLUMN "forms"."Photo" IS 'link to media';

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "relations" ADD FOREIGN KEY ("following_user_id") REFERENCES "users" ("id");

ALTER TABLE "relations" ADD FOREIGN KEY ("followed_user_id") REFERENCES "users" ("id");

ALTER TABLE "forms" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "post_tags" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "post_likes" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "post_comments" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "post_views" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "post_medias" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "post_medias" ADD FOREIGN KEY ("media_id") REFERENCES "medias" ("id");

ALTER TABLE "forms" ADD FOREIGN KEY ("Photo") REFERENCES "medias" ("id");

ALTER TABLE "messages" ADD FOREIGN KEY ("sender_id") REFERENCES "users" ("id");

ALTER TABLE "messages" ADD FOREIGN KEY ("recipient_id") REFERENCES "users" ("id");

ALTER TABLE "chat_partisipants" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "chat_partisipants" ADD FOREIGN KEY ("chat_id") REFERENCES "chats" ("id");

ALTER TABLE "messages" ADD FOREIGN KEY ("chat_id") REFERENCES "chats" ("id");
