== README
To reproduce the logging errors, be sure to create `config/logentries.yml` with a token field set for the development environment.
Then you can create a user and from the console run:
```
QueuerJob.perform_later(User.first)
```
You will see the QueuerJob get logged in logentries but nothing else, but if you tail `log/development.log` you will see everything
be logged correctly. So far it seems like it has something to with adding the `resque-loner` and `resque-retry` gems.
