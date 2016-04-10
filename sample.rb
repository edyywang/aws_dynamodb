##############################
# Scan Table
resp = dynamo_db.scan(
	table_name: 'test_table'
)
resp.items[0] # 0是最新加入的item

##############################
# Put Item
hash_item = {
  "test_date": "2016-02-10 13:47:01 +0800",
  "test_id": 6,
  "test_values": {
    "list1": [
      "list_value3",
      "list_value4"
    ],
    "value1": "value3",
    "value2": "value4"
  },
  "test_stats": 4
}

resp = dynamo_db.put_item({
	table_name: 'test_table',
	item: hash_item
})

resp.successful?
resp.on_complete do
	# any thing
end

##############################
# Describe Table
resp = dynamo_db.describe_table({
  table_name: 'test_table'
})
resp.table.item_count

# Storage size and item count are not updated in real-time. They are updated periodically, roughly every six hours.



##############################
# Update Item

resp = dynamo_db.update_item({
  table_name: 'test_table',
  key: {
    'test_id': 5,
    'test_date': '2016-02-10 11:47:01 +0800'
  },
  attribute_updates: {
    'test_stats': {
      value: 6,
      action: 'PUT'
    }
  },
  return_values: 'UPDATED_NEW'
})

resp.successful?

##############################
# Update Item with Update Expression
https://docs.aws.amazon.com/zh_cn/amazondynamodb/latest/developerguide/Expressions.Modifying.html#Expressions.Modifying.ConditionalWrites

http://docs.aws.amazon.com/amazondynamodb/latest/gettingstartedguide/GettingStarted.Python.03.html#GettingStarted.Python.03.03

x = 10

resp = dynamo_db.update_item({
  table_name: 'test_table',
  key: {
    'test_id': 5,
    'test_date': '2016-02-10 11:47:01 +0800'
  },
  update_expression: 'set test_stats = test_stats + :x',
  expression_attribute_values: {
    ':x': x
  },
  return_values: 'UPDATED_NEW'
})

resp.successful? #資料每次都會被加上10
