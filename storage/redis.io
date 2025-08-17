Table reaction {
  id bigint [primary key]
  post_id bigint [not null]
  type smallint [not null]
  count integer
}