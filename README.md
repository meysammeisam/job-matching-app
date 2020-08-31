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
- Prepare DB `docker-compose run app rails db:create db:migrate`
- Run `docker-compose up`
- Rails console `docker-compose run app rails c`


## Matching Tool

Here we have a service called *MatchingTool*. Matching tool has 2 main logic module:

- Candidate Finder
- Job Finder

### Candidate Finder

This module finds candidates for a specific job and sorts them based on the best matches. The DB result is something like:

```SQL
first_name | ... | matching_rate
------------+---------------
 Havana    | ... |     3
 Smith     | ... |     2
 Nadia     | ... |     1
 Erika     | ... |     1
 Tim       | ... |     0
```

### Job Finder

This module finds the best matched jobs for a specific user's working slot.

### API endpoints

2 API endpoints are provided to use the Matching Tool:

- `/api/v1/filter_candidates/:job_id`
- `/api/v1/filter_jobs/:working_hour_id`

Because of lack of time, I will write down my approach regarding the Event on Job creation.

- There will be a Job builder service, to create new jobs.
- The Service will trigger Events as background jobs, One of them will call the matching tool and for the first best matches will push some notifications or trigger other events.
