# America Election

You are given two tables "Candidates" and "Results". You are expected to output a table that consists of 2 columns "states" and "votes" where "votes" has the full name of the candidate and their respective number of votes. "States" should be in ascending order, "Name" in ascending order and "Votes" in descending order.

Candidates
| column name | data type |
|-------------|-----------|
| id          | int       |
| first_name  | str       |
| last_name   | str       |

Example
| id | first_name | last_name |
|----|------------|-----------|
| 1  | Abba       | Charlie   |
| 2  | Amy        | Jackson   |
| 3  | Ben        | Robertson |

Results
| column name  | data type |
|--------------|-----------|
| candidate_id | int       |
| state        | str       |

Example
| candidate_id | state    |
|--------------|----------|
| 2            | Alabama  |
| 2            | Florida  |
| 3            | Alaska   |
| 1            | Nebraska |

Expected Output
| state   | votes                                              |
|---------|----------------------------------------------------|
| Alabama | Abba Charlie x 3,Amy Jackson x 2,Ben Robertson x 1 |
| Alaska  | Ben Robertson x 2,Abba Charlie x 1,Amy Jackson x 1 |