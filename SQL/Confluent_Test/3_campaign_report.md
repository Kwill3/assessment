# Active Campaign Engagement Report

A marketing company maintains a database to track its advertising campaigns and engagements. The task is to generate a report that includes the name of each active campaign, the total number of engagements, and the sum of views and clicks for those engagements.  

The result should have the following columns: campaign_name | total_engagements | total_views_and_clicks.
- campaign_name: the name of the active campaign
- total_engagements: the number of engagements
- total_views_and_clicks: the combined number of views and clicks
The result should be sorted in ascending order by campaign_name.

Note:
- Only active campaigns should be included in the report.
- The is_active field in the campaigns table indicates whether a campaign is active(1 for active, 0 for inactive).

## Schema
Table: campaigns
```
_______________________________________________________________________________________
NAME        | TYPE         | CONSTRAINTS           | DESCRIPTION                       |
---------------------------------------------------------------------------------------|
id          | INTEGER      | NOT NULL PRIMARY KEY  | The identifier of the campaign    |
name        | VARCHAR(255) |                       | The name of the campaign          |
is_active   | SMALLINT     |                       | Campaign is active flag           |
---------------------------------------------------------------------------------------|
```

Table: engagements
```
___________________________________________________________________________
NAME        | TYPE    | CONSTRAINTS    | DESCRIPTION                       |
---------------------------------------------------------------------------|
campaign_id | INTEGER | FK             | The reference to the campaign     |
views       | INTEGER |                | Total views of the engagement     |
clicks      | INTEGER |                | Total clicks of the engagement    |
---------------------------------------------------------------------------|
engagements.campaign_id REFERENCES campaigns.id
```

## Sample Data
Table: campaigns
```
_________________________________________
id  | name                  | is_active  |
-----------------------------------------|
 1  | SummerSavings         | 1          | 
 2  | FallFrenzy            | 1          | 
 3  | WinterWonderland      | 1          | 
 4  | SpringSale            | 1          | 
 5  | BacktoSchool          | 1          | 
 6  | HolidayHappiness      | 1          | 
 7  | NewYearNewYou         | 1          | 
 8  | SuperSaverSaturday    | 1          | 
 9  | FlashSaleFriday       | 1          | 
 10 | WeekendWarrior        | 0          | 
 11 | MidweekMadness        | 1          | 
 12 | BigBangBonanza        | 0          | 
 13 | EpicEventExtravaganza | 1          | 
 14 | MegaMarkdownMania     | 1          | 
 15 | UltimateUpgradeSale   | 1          | 
 16 | FantasticFreebies     | 1          | 
 17 | VIPValueVortex        | 1          | 
 18 | LuxuryLifestyleLaunch | 1          | 
 19 | SavingsSpectacular    | 0          | 
 20 | DealDash              | 1          | 
-----------------------------------------|
```

Table: campaigns
```
________________________________
campaign_id | views  | clicks  |
-------------------------------|
 11         | 859    | 100     | 
 4          | 630    | 63      | 
 6          | 63     | 7       | 
 5          | 561    | 99      | 
 17         | 142    | 18      | 
 3          | 913    | 308     | 
 6          | 416    | 89      | 
 9          | 499    | 88      | 
 4          | 367    | 11      | 
 14         | 464    | 45      | 
 10         | 50     | 3       | 
 5          | 673    | 12      | 
 18         | 977    | 71      | 
 13         | 343    | 257     | 
 1          | 271    | 203     | 
 17         | 946    | 445     | 
 10         | 416    | 120     | 
 20         | 155    | 142     | 
 20         | 24     | 3       | 
 19         | 467    | 400     | 
 11         | 418    | 224     | 
 12         | 428    | 410     | 
 16         | 36     | 13      | 
 1          | 479    | 303     | 
 17         | 573    | 46      | 
 1          | 100    | 36      | 
 6          | 602    | 594     | 
-------------------------------|
```

## Expected Output
```
BacktoSchool 25 18262
DealDash 16 10249
EpicEventExtravaganza 19 16725
FallFrenzy 16 12126
FantasticFreebies 19 12014
FlashSaleFriday 22 13412
HolidayHappiness 20 16238
LuxuryLifestyleLaunch 19 13116
MegaMarkdownMania 25 19984
MidweekMadness 12 9954
NewYearNewYou 18 15003
SpringSale 12 9929
SummerSavings 26 17075
SuperSaverSaturday 24 21130
UltimateUpgradeSale 15 11944
VIPValueVortex 19 14620
WinterWonderland 24 18999
```