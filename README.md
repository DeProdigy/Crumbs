# Crumbs

## V1

###### Base Url: [https://crumbs-app.herokuapp.com/api/v1](https://crumbs-app.herokuapp.com/api/v1)
### Users

Already pre-seeded in the DB

### Posts
######To get all the posts:
* make a `GET` to '/posts'
* if any posts exist, the response will be an array of user objects each with a posts property:

```
	[
		{
		 	'id' => 41,
      		'username' => 'Alex',
			'title' => 'Starbucks',
	   		'image_url' => 'something.com/abcdefghijk',
	   		'latitude' => '30.63784',
      		'longitude' => '-58.92023',
	   		'updated_at' => '2015-10-06T20:02:25.061Z',
	   		'created_at' => '2015-10-06T20:02:25.061Z'
		},
    	{
		 	'id' => 42,
      		'username' => 'Daniel',
			'title' => 'DD',
	   		'image_url' => 'something.com/abcdefghijk',
	   		'latitude' => '30.63784',
      		'longitude' => '-58.92023',
	   		'updated_at' => '2015-10-06T20:02:25.061Z',
	   		'created_at' => '2015-10-06T20:02:25.061Z'
		}
	]
```

* if no posts exist, the response will be an empty array `[]`

######To create a post:

* make a `POST` to `/posts` with a `Post` hash format:

```
	{
      post => {
        user_id => 'user-id',
        title => 'Some title',
        image_url => 'something.com/abcdefghijk',
        latitude => '30.63784',
        longitude => '-58.92023'
      }
    }
```

* if created successfully, expect an object with a new DB id:

```
	{
		'id' => 3,
		'image_url' => 'something.com/abcdefghijk',
		'title' => 'Some title',
		'latitude' => '30.63784',
		'longitude' => '-58.92023',
		'user_id' => '7' 
	}
```
*  if not created, expect an `error` with a message
