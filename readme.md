# Cron Parser, deliveroo assignment

## Setup (plain unix)

```bash
# first install all the dependencies
gem install bundler && bundle install

# run the tests
bundle exec rspec

# run the script (as executable)
bin/cron_parser "*/15 0 1,15 * 1-5 /usr/bin/find"
```

## Setup (docker)

Just to make thing easier, you can run docker commpose up, and it will install the deps, run rspec than run the script, see `docker-compose.yml` for more details.

```bash
docker compose up
```

## Filestructure

```
.
├── bin
│   └── cron_parser                <-- small wrapper around the cron_parser.rb
├── spec
│   └── cron_parser_spec.rb        <-- tests for the cron_parser.rb
├── src
│   └── cron_parser.rb             <-- the actual cron parser, aka the assignment.
├── docker-compose.yml             <-- docker compose file
├── Gemfile                        <-- gemfile for bundler
├── Gemfile.lock                   <-- gemfile lock for bundler
├── readme.md                      <-- this file

```

## Time spent:

- approx 30m to write cron_parser in the sh form.
- approx 30m to refactor the code to use a class that can be tested using rspec, and generated the initial tests,  altered them to my liking.
- approx 15m to write the readme, add docker compose etc.

### Author

- [@reneweteling](https://github.com/reneweteling)
- rene@weteling.com
- +316 55 128 199