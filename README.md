# Indie Film Status

Are you a film shooter? AWESOME! Find [me on
Instagram](http://instagram.com/huntca) and say hello, let's be friends.
:smiley:

Developing and scanning film can take a while, but that's ok. That's all part
of the fun.

Use this app to check the status of a set of film orders at
[Indie Film Lab](http://indiefilmlab.com/).

## Deploy to Heroku

First, deploy you app to Heroku:

```bash
$ heroku create yourapp
$ git push yourapp master
```

## Check order status

Once your app is deployed on Heroku, provide your email address and order
numbers in the URL.

```html
http://yourapp.herokuapp.com/#your@email.com/12345,67890
```

**protip:** If you bookmark this URL and keep the bookmark updated with your
current orders, you won't have to remember anything. The status of all your
orders can be checked quickly.

![](screenshot.png)

## Contributing
Please see the [Contributing
Document](https://github.com/chrishunt/indiestatus/blob/master/CONTRIBUTING.md)

## License
Copyright (C) 2015 Chris Hunt, [MIT
License](https://github.com/chrishunt/indiestatus/blob/master/LICENSE.txt)
