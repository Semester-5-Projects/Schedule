# README

## Overview

This **Prolog project** handles the assignment of Teaching Assistants (TAs) to lab sessions over a week while ensuring that no TA is overbooked on any given day. The main features include:

- **Assigning TAs to Lab Sessions:** Ensuring each lab session has a TA assigned.
- **Max Slots per Day:** Ensuring that no TA is assigned more slots in a day than allowed.
- **Weekly Schedule:** Creating a schedule for a week, with TAs assigned to lab sessions each day.

## Files and Predicates

### Main Predicates

1. **`slot_assignment/4`**
   - **Usage:** `slot_assignment(LabsNum, TAs, RemTAs, Assignment).`
   - **Description:** Assigns TAs to a given number of lab sessions, ensuring the assignment is feasible.
   - **Parameters:**
     - `LabsNum`: Number of lab sessions to be assigned.
     - `TAs`: List of TAs with their available slots.
     - `RemTAs`: Remaining TAs after assignment.
     - `Assignment`: Resultant assignment list.

2. **`max_slots_per_day/2`**
   - **Usage:** `max_slots_per_day(DaySched, Max).`
   - **Description:** Checks if any TA exceeds the maximum allowed slots per day.
   - **Parameters:**
     - `DaySched`: List of assignments for the day.
     - `Max`: Maximum number of slots a TA can handle in a day.

3. **`day_schedule/4`**
   - **Usage:** `day_schedule(DayLabs, TAs, RemTAs, DayAssignment).`
   - **Description:** Creates the schedule for one day, assigning TAs to lab sessions.
   - **Parameters:**
     - `DayLabs`: List of lab sessions for the day.
     - `TAs`: List of TAs with their available slots.
     - `RemTAs`: Remaining TAs after the day's assignment.
     - `DayAssignment`: Resultant assignment list for the day.

4. **`week_schedule/4`**
   - **Usage:** `week_schedule(WeekLabs, TAs, DayMax, WeekAssignment).`
   - **Description:** Creates the schedule for a week, ensuring daily assignments meet the constraints.
   - **Parameters:**
     - `WeekLabs`: List of lists, each containing lab sessions for a day.
     - `TAs`: List of TAs with their available slots.
     - `DayMax`: Maximum slots a TA can handle in a day.
     - `WeekAssignment`: Resultant weekly assignment list.

### Helper Predicates

- **`ta_slot_assignment/3`**
  - **Usage:** `ta_slot_assignment(TAs, UpdatedTAs, TA).`
  - **Description:** Updates the TA's slot count after an assignment.
  - **Parameters:**
    - `TAs`: Initial list of TAs with slots.
    - `UpdatedTAs`: List of TAs after slot decrement.
    - `TA`: TA to be assigned.

- **`letters/2`**
  - **Usage:** `letters(TAs, Letters).`
  - **Description:** Extracts TA identifiers.
  - **Parameters:**
    - `TAs`: List of TAs.
    - `Letters`: Extracted identifiers.

- **`slot_assignmenth/3`**
  - **Usage:** `slot_assignmenth(LabsNum, TAs, Assignments).`
  - **Description:** Helper for slot assignment.
  - **Parameters:**
    - `LabsNum`: Number of labs.
    - `TAs`: List of TAs.
    - `Assignments`: Resultant assignments.

- **`hel/3`**
  - **Usage:** `hel(Element, List, Remainder).`
  - **Description:** Selects an element from a list and returns the remainder.
  - **Parameters:**
    - `Element`: Selected element.
    - `List`: Initial list.
    - `Remainder`: List after removal of the element.

- **`pack/2`, `transfer/4`, `encode/2`, `transform/2`**
  - **Description:** Helper predicates for packing and encoding lists, used in `max_slots_per_day/2` to check TA slot constraints.

## Usage

1. **Loading the Project:**
   Load the Prolog file in your Prolog interpreter:
   ```prolog
   ?- [filename].
   
2. **Generating a Weekly Schedule:**
   Example:
   ```prolog
   ?- week_schedule([[2, 2, 3], [2, 3], [2, 2, 2], [3, 2], [2]], [ta(a, 5), ta(b, 5), ta(c, 5)], 2, Assignment).

## Contribution

Feel free to contribute to this project by forking the repository, making changes, and submitting a pull request. Ensure your code follows the Prolog style guidelines and includes comments for clarity.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.




