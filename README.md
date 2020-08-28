# Simple Job Matching App

## Goal

Suggest solution for a Job Matching module, knowing that User may have his own preferred Job attributes:

- job types
- job locations
- preferred working hours

And that Job model may provide some part of this information.
There should be RESTful API response which show list of matches, sorted by matching level for two resources:

- best matches for users
- best matches job candidates from the list of users

Also, when the new job will be added, then if it will match to any of the candidates, then the appropriate event(s) should be generated.

## How to Run it

- Docker build `docker-compose build app`
- Prepare DB  `docker-compose run app rails db:create db:migrate`
- Run `docker-compose up`
