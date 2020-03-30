# Database-Model-for-Army
Implements some army activities which affect databse of Army.

## Outsider_functions

[x] 1.  viewAllRanks()

[x] 2.  viewAllCommands()

[x] 3.  selfRecruit()

[x] 4.  viewAllMartyred()

[x] 5.  viewStats()

## Soldier_login

[x] 6.  soldierLogin()

## Soldier_functions

[x] 7.  displayDetails()

[x] 8.  addHealthCheckup()

[x] 9. allDependency()

[x] 10. retire()

[x] 11. promote() 

[x] 12. displayPayCheck()

[x] 13. displayNumberOfDaysServed()

## Division Commander

3.3. DivComm_functions

3.3.1.Become the commander of some other division or brigade/corp or command
Updates the division, brigade/corp and command ID controlled by the commander. If
the commander does not belong to the particular division, brigade/corp or command,
the corresponding details are updated.

3.3.2.Promote a soldier to a commander of a division
Updates the division, brigade/corp and command ID of the soldier and changes his
subclass to that of a commander of a division This would provide the soldier with access
to the functionalities available for his subclass. If the commander does not belong to the
particular division, brigade/corp or command, the corresponding details are updated.
This can be performed by a commander of a brigade/corp or command or by the Chief
of Army Staff.

3.3.3.Promote a commander of a division to that of a brigade/corp
Updates the command ID of the division commander and changes his subclass to that of
a brigade/corp commander. This would provide the soldier with access to the
functionalities available for his subclass. If the commander does not belong to the
particular command, the corresponding details are updated. This can be performed by
the General Officer Commanding-in-Chief or the Chief of Army Staff.

3.3.4.Promote a commander of a brigade/corp to that of a command
Updates the command ID of the brigade/corp commander and changes his subclass to
that of a command. This would provide the soldier with access to the functionalities 
available for his subclass. If the commander does not belong to the particular
brigade/corp or command, the corresponding details are updated. This can be
performed by the Chief of Army Staff only.

3.3.5.Recruit soldiers into the division/brigade/command under his control
Updates the division, brigade/corp and command ID of the soldier whose ID is given.

3.3.6.Display the military details of all the soldiers under his
control
Displays the military details of all the soldiers under the commander

3.3.7.Display the ages, military achievements and physical
parameters of the soldiers under his control
Displays all the requested details of all the soldiers under the commander in order to
judge their capabilities

3.3.8.Display the details of all the divisions under the his control
Displays the details of all the divisions (division name and number of soldiers in each
division) along with the division commander under the commander under
consideration. Note that this functionality is applicable only to the brigade commander,
the Chief of Army Staff, and the General Officer Commanding-in-Chief.

3.3.9.Display the details of all the brigades under his control
Displays the details of all the brigades/corps along with their corresponding
commander under the General Officer Commanding-in-Chief. Note that this
functionality is applicable only to the General Officer Commanding-in-Chief and the
Chief of Army Staff.

3.
3.10. Allocate soldier as a commander to a division/brigade
under his control
Updates the value of the division/brigade under his control. Note that a brigade
commander can assign a commander to a division belonging to the brigade under his
control while a command commander can assign a commander to a brigade or a
division belonging to the command under his control. 

3.3.11. Add/Remove/modify a division/brigade/command
Adds or deletes or update(change the name) of a division or brigade/corp under the
control of the commander. Note that a brigade commander can add/remove/modify
only divisions under his control while a command commander can add/remove
divisions/brigades under his control. However the Chief of Army Staff can
add/remove/modify all the commands, brigades/corps and divisions.

3.3.12. Modify the salary increments of a particular
division/brigade/command under his control
Updates the salary increment corresponding a division/brigade/command under the
control of the commander. Note that a brigade commander can update only for
divisions/brigade under his control while a command commander can update for
divisions/brigades/command under his control. However the Chief of Army Staff can
add/remove/modify for all the commands, brigades/corps and divisions.

3.4. CorpComm_functions

3.5. CommComm_functions

3.6. Chief_functions

3.7. Admin_functions


3.4.1.Delete soldier from record
Deletes the particular soldier from the records

3.4.2.Update soldier details in case he is dead
Updates the date of retirement and death and also removes the dependencies. No
pension is provided

3.4.
3.Update the base salaries corresponding the ranks
Updates the base salary corresponding to the rank 
