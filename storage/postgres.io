Table user {
  id integer [primary key]
  name varchar [not null]
  email varchar [not null, unique]
  phone varchar [not null, unique]
  country varchar
}

Table subscription {
  user_id bigint [not null]
  target_user_id bigint [not null]
}

Table post {
  id bigint [primary key]
  user_id bigint [not null]
  title varchar [not null]
  body text [not null]
  geo GEOGRAPHY [not null, note: "geo coordinates, associated with post"]
  created_at timestamp [not null]
}

Table comment {
  id bigint [primary key]
  user_id bigint [not null]
  post_id bigint [not null]
  body text [not null]
  created_at timestamp [not null]
}

Table post_photo {
  post_id bigint [not null]
  url varchar [not null, note: "url to photo on the blob storage"]
  created_at timestamp [not null]
}

Ref: user.id < subscription.user_id
Ref: user.id < subscription.target_user_id

Ref: post.user_id > user.id
Ref: comment.user_id > user.id

Ref: comment.post_id > post.id
Ref: post_photo.post_id > post.id


