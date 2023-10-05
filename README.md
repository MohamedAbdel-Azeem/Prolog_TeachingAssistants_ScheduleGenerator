__Project Name: Prolog Teaching Assistant Schedule Generator__

**This project implements a Prolog program to generate teacher assistant (TA) schedules. The program takes as input a list of TAs with their maximum load (slots per week or day), the number of slots per day, and the number of labs per week. The program then generates a schedule such that:**

- Each lab is assigned exactly one TA.
- No TA is assigned more labs than their maximum load.
- The number of slots assigned to each TA per day does not exceed the specified number.


**Notes:**

- The program assumes that all TAs are available for all slots.
- The program does not consider any other constraints, such as TA preferences or lab conflicts.

**Contributions:**

I welcome any contributions to this project. If you have any suggestions or bug reports, please feel free to contact me.

## Additional notes:

The program uses the following Prolog predicates:

- ta_slot_assignment/3: Assigns a TA to a slot.
- no_dups/1: Checks if a list contains any duplicate elements.
- slot_assignment/4: Assigns a list of TAs to a list of slots.
- max_slots_per_day/2: Checks if the number of slots assigned to each TA per day does not exceed a particular specified number.
- day_schedule/4: Generates a schedule for a single day.
- week_schedule/4: Generates a schedule for the entire week.

The program can be easily modified to support additional constraints, such as TA preferences or lab conflicts. To do this, you would simply need to add new predicates to the program that check for and enforce these constraints.
