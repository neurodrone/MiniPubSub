Publish/Subscribe using Redis
=============================

A succinct, quickly conjured, publish/subscribe system built using [Redis](http://redis.io/). Each message is converted into a csv before transmitting so as to keep the payload to the minimum. Using basic Ruby marshalling would have been better, but what the heck. More projects built off [Redis](http://redis.io/) coming up shortly.

Usage:
------
Start the Redis server on your machine by running the "./redis-server" program from your redis/src directory. Feel free to invoke publisher/subscriber stubs in any order that you wish to.  

Invoke Subscriber:
------------------
	$ ruby subscriber.rb

OR

	$ ruby subscriber.rb channel_name
Invoking the subscriber without any arguments will make it start listening for the presence of any/all channels. If you want the subscriber to listen to a specific channel make sure you add the name of that channel as a command line parameter.

Invoke Publisher:
-----------------
	$ ruby publisher.rb 
OR
	$ ruby publisher.rb channel_name user_name
You can choose not to provide any channel name or user name in which case it will apply a default channel ("channel1") and the string present in the UNIX environment variable called "USER".
