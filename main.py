import subprocess as sp
import pymysql
import pymysql.cursors
from tabulate import tabulate
from wrap_tables import *
from datetime import date


def printRowsAsTable(rows):
    r = []
    r.append(list(rows[0].keys()))
    for row in rows:
        rr = []
        for k in row.keys():
            rr.append(row[k])
        r.append(rr)
    print(tabulate(r, tablefmt="psql", headers="firstrow"))
    print()


def printRowsAsForm(rows, isOneLine):
    i = 1
    for row in rows:
        if(isOneLine == 0):
            print(i, ":")
        for k in row.keys():
            print(k, ":", row[k])
        print()
        i += 1


def printRowsAsLine(rows):
    for row in rows:
        for k in row.keys():
            print(row[k], end=', ')


def viewAllRanks():
    try:
        cur.execute("SELECT * FROM RANKS")
        rows = cur.fetchall()
        printRowsAsTable(rows)
    except Exception as e:
        con.rollback()
        print("DATABASE ERROR! Error code: ", e)


def viewAllCommands():
    try:
        cur.execute("SELECT CommandID, CommandName, CONCAT(FirstName,\" \",MiddleInitial,\" \",LastName) AS CommandingChiefName FROM SOLDIER_PERSONAL, COMMANDS WHERE CommandingChiefID=ID")
        rows = cur.fetchall()
        printRowsAsTable(rows)
    except Exception as e:
        con.rollback()
        print("DATABASE ERROR! Error code: ", e)


def viewAllMartyred():
    try:
        cur.execute("SELECT CONCAT(FirstName,\" \",MiddleInitial,\" \",LastName) AS Name, CONCAT(\"Building no:\",BuildingNo,\", Street no:\",StreetNo,\", \",Locality,\", \",City,\" \",ZipCode,\", \",District,\", \",States) AS Address, DeathDate FROM SOLDIER_PERSONAL, SOLDIER_ADDRESS, SOLDIER_DATES WHERE SOLDIER_PERSONAL.ID=SOLDIER_ADDRESS.ID AND SOLDIER_PERSONAL.ID=SOLDIER_DATES.ID AND DeathDate IS NOT NULL")
        rows = cur.fetchall()
        printRowsAsTable(rows)
    except Exception as e:
        con.rollback()
        print("DATABASE ERROR! Error code: ", e)


def selfRecruit():
    try:
        row = {}
        print("Enter your details: ")
        print()
        row["ID"] = int(input("ID:"))
        ID = row["ID"]
        print()
        print("Personal Details: ")
        row["FirstName"] = input("First Name: ")
        row["LastName"] = input("Last Name: ")
        row["MiddleInitial"] = input("Middle Name: ")
        row["Sex"] = input("Sex: ")
        row["Aadhar_number"] = input("Aadhar Number: ")
        row["Marital_Status"] = input("Marital Status: ")
        row["Highest_Educational_Qualification"] = input(
            "Highest Educational Qualification: ")
        row["BirthDate"] = input("Date of Birth:")
        query = "INSERT INTO SOLDIER_PERSONAL VALUES('%d', '%s', '%s', '%s', '%s', '%s', '%s', '%s')" % (
            row["ID"], row["FirstName"], row["LastName"], row["MiddleInitial"], row["Sex"], row["Aadhar_number"], row["Marital_Status"], row["Highest_Educational_Qualification"])
        cur.execute(query)
        row["RecruitmentDate"] = date.today().strftime("%Y/%m/%d")
        query = "INSERT INTO SOLDIER_DATES(ID,BirthDate,RecruitmentDate) VALUES('%d', '%s', '%s')" % (
            row["ID"], row["BirthDate"], row["RecruitmentDate"])
        cur.execute(query)
        print()
        print("Address Details: ")
        row["BuildingNo"] = input("Building No: ")
        row["StreetNo"] = input("Street No: ")
        row["Locality"] = input("Locality: ")
        row["City"] = input("City: ")
        row["ZipCode"] = input("ZipCode: ")
        row["District"] = input("District: ")
        row["States"] = input("State: ")
        query = "INSERT INTO SOLDIER_ADDRESS VALUES('%d', '%s', '%s', '%s', '%s', '%s', '%s', '%s')" % (
            row["ID"], row["BuildingNo"], row["StreetNo"], row["Locality"], row["City"], row["ZipCode"], row["District"], row["States"])
        cur.execute(query)
        print()
        print("Contact Details: ")
        row["PhoneNumber"] = input("Phone No: ")
        query = "INSERT INTO SOLDIER_PHONE_NUMBER VALUES('%d', '%s')" % (
            row["ID"], row["PhoneNumber"])
        cur.execute(query)
        row["EmailID"] = input("Email ID: ")
        query = "INSERT INTO SOLDIER_EMAIL_ID VALUES('%d', '%s')" % (
            row["ID"], row["EmailID"])
        cur.execute(query)
        print()
        print("Parental Information: ")
        print("Father's Name: ")
        row["Fathers_FirstName"] = input("First Name: ")
        row["Fathers_LastName"] = input("Last Name: ")
        row["Fathers_MiddleInitial"] = input("Middle Name: ")
        print("Mother's Name: ")
        row["Mothers_FirstName"] = input("First Name: ")
        row["Mothers_LastName"] = input("Last Name: ")
        row["Mothers_MiddleInitial"] = input("Middle Name: ")
        query = "INSERT INTO SOLDIER_PARENTS VALUES('%d', '%s', '%s', '%s', '%s', '%s', '%s')" % (
            row["ID"], row["Fathers_FirstName"], row["Fathers_LastName"], row["Fathers_MiddleInitial"], row["Mothers_FirstName"], row["Mothers_LastName"], row["Mothers_MiddleInitial"])
        cur.execute(query)
        print()
        print("Military details: ")
        row["RankID"] = int(input("RankID: "))
        row["DivisionID"] = int(input("DivisionID: "))
        row["CorpID"] = int(input("Corp ID: "))
        row["CommandID"] = int(input("Command ID: "))
        query = "INSERT INTO SOLDIER_MILITARY(ID,RankID,DivisionID,CorpID,CommandID) VALUES('%d', '%d', '%d', '%d', '%d')" % (
            row["ID"], row["RankID"], row["DivisionID"], row["CorpID"], row["CommandID"])
        cur.execute(query)
        print()
        print("Login details")
        print("ID: ", ID)
        row["Pass"] = input("Password: ")
        query = "INSERT INTO SOLDIER_LOGIN VALUES('%d', '%s')" % (
            row["ID"], row["Pass"])
        cur.execute(query)
        con.commit()
        print("Inserted Into Database")
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)
    return


def viewStats():
    yearToDisplayStat = int(
        input("Enter the year whose statistics should be displayed: "))
    try:
        cur.execute("SELECT COUNT(RecruitmentDate) AS count FROM SOLDIER_DATES WHERE YEAR(RecruitmentDate)='%d'" % (
            yearToDisplayStat))
        rows = cur.fetchall()
        print("Number of soldiers recruited this year: ", rows[0]['count'])
        cur.execute("SELECT COUNT(DeathDate) AS count FROM SOLDIER_DATES WHERE YEAR(DeathDate)='%d'" % (
            yearToDisplayStat))
        rows = cur.fetchall()
        print("Number of soldiers killed this year: ", rows[0]['count'])
        cur.execute("SELECT COUNT(RetirementDate) AS count FROM SOLDIER_MILITARY WHERE YEAR(RetirementDate)='%d'" % (
            yearToDisplayStat))
        rows = cur.fetchall()
        print("Number of soldiers retired this year: ", rows[0]['count'])
    except Exception as e:
        con.rollback()
        print("DATABASE ERROR! Error code: ", e)


def adminReports():
    while(1):
        tmp = sp.call('clear', shell=True)
        print("ADMIN REPORTS")
        print("1.  SOLDIER_PERSONAL")
        print("2.  SOLDIER_ADDRESS")
        print("3.  SOLDIER_PHONE_NUMBER")
        print("4.  SOLDIER_EMAIL_ID")
        print("5.  SOLDIER_PARENTS")
        print("6.  SOLDIER_DATES")
        print("7.  SOLDIER_MILITARY_ACCOMPLISHMENTS")
        print("8.  SOLDIER_MEDICAL")
        print("9.  SOLDIER_MILITARY")
        print("10. DEPENDENTS")
        print("11. RANKS")
        print("12. COMMANDS")
        print("13. CORPS")
        print("14. DIVISIONS")
        print("15. CHIEF_OF_ARMY_STAFF")
        print("16. GENERAL_OFFICER_COMMANDING_IN_CHIEF")
        print("17. COMMANDER_OF_CORP")
        print("18. COMMANDER_OF_DIVISION")

        print("19. Back")
        c = int(input("\nEnter choice: "))
        tmp = sp.call('clear', shell=True)
        row = []
        if(c == 19):
            break
        if c == 1:
            try:
                cur.execute("SELECT * FROM SOLDIER_PERSONAL")
                rows = cur.fetchall()
                printRowsAsTable(rows)
            except Exception as e:
                con.rollback()
                print("DATABASE ERROR! Error code: ", e)
        elif c == 2:
            try:
                cur.execute("SELECT * FROM SOLDIER_ADDRESS")
                rows = cur.fetchall()
                printRowsAsTable(rows)
            except Exception as e:
                con.rollback()
                print("DATABASE ERROR! Error code: ", e)
        elif c == 3:
            try:
                cur.execute("SELECT * FROM SOLDIER_PHONE_NUMBER")
                rows = cur.fetchall()
                printRowsAsTable(rows)
            except Exception as e:
                con.rollback()
                print("DATABASE ERROR! Error code: ", e)
        elif c == 4:
            try:
                cur.execute("SELECT * FROM SOLDIER_EMAIL_ID")
                rows = cur.fetchall()
                printRowsAsTable(rows)
            except Exception as e:
                con.rollback()
                print("DATABASE ERROR! Error code: ", e)
        elif c == 5:
            try:
                cur.execute("SELECT * FROM SOLDIER_PARENTS")
                rows = cur.fetchall()
                printRowsAsTable(rows)
            except Exception as e:
                con.rollback()
                print("DATABASE ERROR! Error code: ", e)
        else:
            print("Invalid option entered!")
        tmp = input("\nEnter any key to CONTINUE>")


def adminUpdations():
    pass


def adminDeletions():
    while(1):
        tmp = sp.call('clear', shell=True)
        print("ADMIN DELETIONS")
        print("1. SOLDIER")
        print("2. DIVISION")
        print("3. CORP")
        print("4. COMMAND")
        print("5. Back")
        c = int(input("\nEnter choice: "))
        tmp = sp.call('clear', shell=True)
        row = []
        if(c == 5):
            break
        if c == 1:
            try:
                cur.execute("SELECT * FROM SOLDIER_PERSONAL")
                rows = cur.fetchall()
                printRowsAsTable(rows)
            except Exception as e:
                con.rollback()
                print("DATABASE ERROR! Error code: ", e)
        elif c == 2:
            try:
                cur.execute("SELECT * FROM SOLDIER_ADDRESS")
                rows = cur.fetchall()
                printRowsAsTable(rows)
            except Exception as e:
                con.rollback()
                print("DATABASE ERROR! Error code: ", e)
        elif c == 3:
            try:
                cur.execute("SELECT * FROM SOLDIER_PHONE_NUMBER")
                rows = cur.fetchall()
                printRowsAsTable(rows)
            except Exception as e:
                con.rollback()
                print("DATABASE ERROR! Error code: ", e)
        elif c == 4:
            try:
                cur.execute("SELECT * FROM SOLDIER_EMAIL_ID")
                rows = cur.fetchall()
                printRowsAsTable(rows)
            except Exception as e:
                con.rollback()
                print("DATABASE ERROR! Error code: ", e)
        elif c == 5:
            try:
                cur.execute("SELECT * FROM SOLDIER_PARENTS")
                rows = cur.fetchall()
                printRowsAsTable(rows)
            except Exception as e:
                con.rollback()
                print("DATABASE ERROR! Error code: ", e)
        else:
            print("Invalid option entered!")
        tmp = input("\nEnter any key to CONTINUE>")



def adminFunctions():
    while(1):
        tmp = sp.call('clear', shell=True)
        print("WELCOME ADMIN")
        print("1. REPORTS")
        print("2. UPDATIONS")
        print("3. DELETIONS")
        print("4. Back")
        c = int(input("\nEnter choice: "))
        tmp = sp.call('clear', shell=True)
        row = []
        if c == 1:
            adminReports()
        elif c == 2:
            adminUpdations()
        elif c == 3:
            adminDeletions()
        elif c == 4:
            break
        elif c==5:
            query=input()
            cur.execute(query)
            rows = cur.fetchall()
            printRowsAsTable(rows)
        else:
            print("Invalid option entered!")
        tmp = input("\nEnter any key to CONTINUE>")


def loginSoldier():
    print("LOGIN AS A SOLDIER")
    ID = int(input("ID: "))
    Pass = input("Password: ")
    if(ID == -1 and Pass == "-1"):
        adminFunctions()
        return -1
    try:
        cur.execute("SELECT ID,Pass FROM SOLDIER_LOGIN WHERE ID='%d' AND Pass='%s'" % (
            ID, Pass))
        rows = cur.fetchall()
        if(rows == ()):
            print("INVALID USERNAME/PASSWORD")
            return -1
        else:
            return ID
    except Exception as e:
        con.rollback()
        print("DATABASE ERROR! Error code: ", e)
        return -1


def outsiderFunctions(c):
    if(c == 4):
        viewAllMartyred()
    elif(c == 1):
        viewAllRanks()
    elif(c == 2):
        viewAllCommands()
    elif(c == 3):
        selfRecruit()
    elif(c == 5):
        viewStats()
    else:
        print("Error: Invalid Option")


def displayPersonalDetails(ID):
    try:
        cur.execute("SELECT A.ID, CONCAT(FirstName,\" \",MiddleInitial,\" \",LastName) AS SOLDIER_NAME, SEX, Aadhar_number AS AADHAR_NUMBER, Marital_Status AS MARITAL_STATUS, Highest_Educational_qualification AS HIGHEST_EDUCATIONAL_QUALIFICATION, CONCAT(BuildingNo,\", \",StreetNo,\", \",Locality,\", \",City,\", \",ZipCode,\", \",District, \", \", States) AS ADDRESS, BirthDate as DATE_OF_BIRTH, RecruitmentDate AS DATE_OF_RECRUITMENT, DeathDate AS DATE_OF_DEATH, CONCAT(Fathers_FirstName, \" \",Fathers_MiddleInitial,\" \",Fathers_LastName) AS NAME_OF_FATHER, CONCAT(Mothers_FirstName,\" \",Mothers_MiddleInitial,\" \",Mothers_LastName) AS NAME_OF_MOTHER FROM SOLDIER_PERSONAL A, SOLDIER_ADDRESS B, SOLDIER_DATES C, SOLDIER_PARENTS D WHERE A.ID=B.ID AND B.ID=C.ID AND C.ID=D.ID AND D.ID='%d'" % (ID))
        rows = cur.fetchall()
        printRowsAsForm(rows, 1)
        cur.execute(
            "SELECT PhoneNumber FROM SOLDIER_PHONE_NUMBER WHERE ID='%d'" % (ID))
        rows = cur.fetchall()
        print("PHONE_NUMBER: ", end="")
        printRowsAsLine(rows)
        print()
        cur.execute(
            "SELECT EmailID FROM SOLDIER_EMAIL_ID WHERE ID='%d'" % (ID))
        rows = cur.fetchall()
        print("EMAIL_ID: ", end="")
        printRowsAsLine(rows)
        print()
        print()
        print("MEDICAL TESTS: ")
        cur.execute(
            "SELECT * FROM SOLDIER_MEDICAL WHERE ID='%d'" % (ID))
        rows = cur.fetchall()
        printRowsAsForm(rows, 0)
    except Exception as e:
        con.rollback()
        print("DATABASE ERROR! Error code: ", e)
        return -1


def displayMilitaryDetails(ID):
    try:
        cur.execute("SELECT * FROM SOLDIER_MILITARY WHERE ID= '%d'" % (ID))
        rows = cur.fetchall()
        printRowsAsForm(rows, 1)
        cur.execute(
            "SELECT MilitaryAccomplishments FROM SOLDIER_MILITARY_ACCOMPLISHMENTS WHERE ID= '%d'" % ID)
        rows = cur.fetchall()
        print("MILITARY_ACCOMPLISHMENTS: ", end="")
        printRowsAsLine(rows)
    except Exception as e:
        con.rollback()
        print("DATABASE ERROR! Error code: ", e)
        return -1


def displayDetails(ID):
    while(1):
        tmp = sp.call('clear', shell=True)
        print("DISPLAY DETAILS ")
        print()
        print("1. Personal details")
        print("2. Military details")
        print("3. Back")
        c = int(input("\nEnter choice: "))
        tmp = sp.call('clear', shell=True)
        if c == 1:
            displayPersonalDetails(ID)
        elif c == 2:
            displayMilitaryDetails(ID)
        elif c == 3:
            break
        else:
            print("Invalid option entered!")
        tmp = input("\nEnter any key to CONTINUE>")


def updateName(ID):
    try:
        row = {}
        print("Current name: ")
        query = "SELECT FirstName, MiddleInitial, LastName FROM SOLDIER_PERSONAL WHERE ID='%d' " % (
            ID)
        cur.execute(query)
        rows = cur.fetchall()
        print(rows[0]['FirstName'], rows[0]['MiddleInitial'],
              rows[0]['LastName'], sep=" ")
        print("New name:")
        row["FirstName"] = input("First Name: ")
        row["LastName"] = input("Last Name: ")
        row["MiddleInitial"] = input("Middle Name: ")
        query = "UPDATE SOLDIER_PERSONAL SET FirstName='%s', MiddleInitial='%s', LastName='%s' WHERE ID='%d'" % (
            row["FirstName"], row["LastName"], row["MiddleInitial"], ID)
        cur.execute(query)
        con.commit()
        print("Successfully updated.")
    except Exception as e:
        con.rollback()
        print("Failed to update database")
        print(">>>>>>>>>>>>>", e)


def updateAadharNumber(ID):
    try:
        row = {}
        print("Current Aadhar Number: ")
        query = "SELECT Aadhar_number FROM SOLDIER_PERSONAL WHERE ID='%d' " % (
            ID)
        cur.execute(query)
        rows = cur.fetchall()
        print(rows[0]["Aadhar_number"])
        row["Aadhar_number"] = input("New Aadhar_number:")
        query = "UPDATE SOLDIER_PERSONAL SET Aadhar_number='%s' WHERE ID='%d'" % (
            row["Aadhar_number"], ID)
        cur.execute(query)
        con.commit()
        print("Successfully updated.")
    except Exception as e:
        con.rollback()
        print("Failed to update database")
        print(">>>>>>>>>>>>>", e)


def updateHighestEducation(ID):
    try:
        row = {}
        print("Current Highest Educational Qualification: ")
        query = "SELECT Highest_Educational_Qualification FROM SOLDIER_PERSONAL WHERE ID='%d' " % (
            ID)
        cur.execute(query)
        rows = cur.fetchall()
        print(rows[0]["Highest_Educational_Qualification"])
        row["Highest_Educational_Qualification"] = input(
            "New Highest Educational Qualification:")
        query = "UPDATE SOLDIER_PERSONAL SET Highest_Educational_Qualification='%s' WHERE ID='%d'" % (
            row["Highest_Educational_Qualification"], ID)
        cur.execute(query)
        con.commit()
        print("Successfully updated.")
    except Exception as e:
        con.rollback()
        print("Failed to update database")
        print(">>>>>>>>>>>>>", e)


def updatePersonalDetails(ID):
    while(1):
        tmp = sp.call('clear', shell=True)
        print("UPDATE PERSONAL DETAILS ")
        print()
        print("1. Name")
        print("2. Aadhar Number")
        print("3. Highest Educational Qualification")
        print("4. Back")
        c = int(input("\nEnter choice: "))
        tmp = sp.call('clear', shell=True)
        row = []
        if c == 1:
            updateName(ID)
        elif c == 2:
            updateAadharNumber(ID)
        elif c == 3:
            updateHighestEducation(ID)
        elif c == 4:
            break
        else:
            print("Invalid option entered!")
        tmp = input("\nEnter any key to CONTINUE>")


def updateMilitaryDetails(ID):
    pass


def updateDetails(ID):
    while(1):
        tmp = sp.call('clear', shell=True)
        print("UPDATE DETAILS ")
        print()
        print("1. Change the highest educational qualification")
        print("2. Military details")
        print("3. Back")
        c = int(input("\nEnter choice: "))
        tmp = sp.call('clear', shell=True)
        if c == 1:
            updatePersonalDetails(ID)
            # updateHighestEducation(ID)
        elif c == 2:
            updateMilitaryDetails(ID)
        elif c == 3:
            break
        else:
            print("Invalid option entered!")
        tmp = input("\nEnter any key to CONTINUE>")


def addHealthCheckup(ID):
    try:
        row = {}
        print("Enter the health checkup results: ")
        print()
        row["Height_cm"] = input("Height (in cm): ")
        row["Weight_kg"] = input("Weight (in kg): ")
        row["BloodGroup"] = input("Blood Group: ")
        row["MedicalTestDate"] = date.today().strftime("%Y/%m/%d")
        query = "INSERT INTO SOLDIER_MEDICAL VALUES('%d','%s', '%s', '%s','%s')" % (
            ID, row["Height_cm"], row["Weight_kg"], row["BloodGroup"], row["MedicalTestDate"])
        cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print("DATABASE ERROR! Error code: ", e)
        return -1


def addDependency(ID):
    try:
        row = {}
        print("Enter the dependency details: ")
        print()
        row["FirstName"] = input("First Name: ")
        row["LastName"] = input("Last Name: ")
        row["MiddleInitial"] = input("Middle Name: ")
        row["Sex"] = input("Sex: ")
        row["Relationship"] = input("Relationship: ")
        row["BirthDate"] = input("Date of birth: ")
        query = "INSERT INTO DEPENDENTS VALUES('%s','%s', '%s', '%d','%s','%s','%s')" % (
            row["FirstName"], row["LastName"], row["MiddleInitial"], ID, row["Sex"], row["Relationship"], row["BirthDate"])
        cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print("DATABASE ERROR! Error code: ", e)
        return -1


def removeDependency(ID):
    try:
        row = {}
        print("Enter the dependency name: ")
        print()
        row["FirstName"] = input("First Name: ")
        row["LastName"] = input("Last Name: ")
        row["MiddleInitial"] = input("Middle Name: ")
        query = "DELETE FROM SOLDIER_PERSONAL WHERE SponsorID= '%d' AND FirstName='%s' AND LastName='%s' AND MiddleInitial='%s'" % (
            ID, row["FirstName"], row["LastName"], row["MiddleInitial"])
        cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print("DATABASE ERROR! Error code: ", e)
        return -1


def viewAllDependency(ID):
    try:
        query = "SELECT CONCAT(FirstName,\" \",MiddleInitial,\" \",LastName) AS Name, Sex, Relationship, BirthDate AS Date_of_birth FROM DEPENDENTS WHERE SponsorID='%d'" % (ID)
        cur.execute(query)
        rows = cur.fetchall()
        printRowsAsTable(rows)
    except Exception as e:
        con.rollback()
        print("DATABASE ERROR! Error code: ", e)


def allDependency(ID):
    while(1):
        tmp = sp.call('clear', shell=True)
        print("DEPENDENCY OPERATIONS ")
        print()
        print("1. Add a dependency")
        print("2. Remove a dependency")
        print("3. View all dependency details")
        print("4. Exit")
        c = int(input("\nEnter choice: "))
        tmp = sp.call('clear', shell=True)
        if c == 1:
            addDependency(ID)
        elif c == 2:
            removeDependency(ID)
        elif c == 3:
            viewAllDependency(ID)
        elif c == 4:
            break
        else:
            print("Invalid option entered!")
        tmp = input("\nEnter any key to CONTINUE>")


def retire(ID):
    try:
        s = date.today().strftime("%Y/%m/%d")
        query = "UPDATE SOLDIER_MILITARY SET RankID=NULL , DivisionID=NULL ,CorpID=NULL , CommandID=NULL , RetirementDate = '%s' WHERE ID=%d " % (
            s, ID)
        cur.execute(query)
        query = "DELETE FROM DEPENDENTS WHERE SponsorID='%d'" % ID
        cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print("DATABASE ERROR! Error code: ", e)


def getRankID(ID):
    try:
        query = "SELECT RankID FROM SOLDIER_MILITARY WHERE ID='%d' " % (ID)
        cur.execute(query)
        rows = cur.fetchall()
        print(rows)  # debug
        return int(rows[0]['RankID'])
    except Exception as e:
        con.rollback()
        print("DATABASE ERROR! Error code: ", e)
        return -1


def promote(ID):
    try:
        kkk = int(input("Enter the ID of the soldier to promote:  "))
        if(getRankID(ID)-getRankID(kkk) <= 2):
            print("Sorry cannot promote")
            return
        d = getRankID(kkk)
        query = "UPDATE SOLDIER_MILITARY SET RankID='%d' WHERE ID = '%d' " % (
            d+1, ID)
        cur.execute(query)
        query = "DELETE FROM DEPENDENTS WHERE SponsorID='%d'" % ID
        cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print("DATABASE ERROR! Error code: ", e)


def displayCommander(ID):
    try:
        print("DIVISION COMMANDER DETAILS")
        query = "SELECT A.BaseSalary, B.SalaryIncrement, C.SalaryIncrement, D.SalaryIncrement FROM RANKS A, COMMANDS B, CORPS C, DIVISIONS D, SALARY E, SOLDIER_MILITARY F WHERE  E.RankID=A.ID AND F.RankID=A.ID AND E.CommandID=B.CommandID AND F.CommandID=F.CommandID AND E.CorpID=C.CorpID AND F.CorpID=C.CorpID AND D.DivID=E.DivisionID AND F.DivisionID=D.DivId AND F.ID='%d'" % (
            ID)
        cur.execute(query)
        rows = cur.fetchall()
        printRowsAsTable(rows)
    except Exception as e:
        con.rollback()
        print("DATABASE ERROR! Error code: ", e)
        return -1


def displayPayCheck(ID):
    try:
        query = "SELECT A.BaseSalary, B.SalaryIncrement, C.SalaryIncrement, D.SalaryIncrement FROM RANKS A, COMMANDS B, CORPS C, DIVISIONS D, SALARY E, SOLDIER_MILITARY F WHERE  E.RankID=A.ID AND F.RankID=A.ID AND E.CommandID=B.CommandID AND F.CommandID=F.CommandID AND E.CorpID=C.CorpID AND F.CorpID=C.CorpID AND D.DivID=E.DivisionID AND F.DivisionID=D.DivId AND F.ID='%d'" % (
            ID)
        cur.execute(query)
        rows = cur.fetchall()
        printRowsAsForm(rows, 1)
    except Exception as e:
        con.rollback()
        print("DATABASE ERROR! Error code: ", e)
        return -1


def displayNumberOfDaysServed(ID):
    try:
        query = "SELECT RetirementDate FROM SOLDIER_MILITARY WHERE ID='%d'" % (
            ID)
        cur.execute(query)
        rows = cur.fetchall()
        if(rows[0]['RetirementDate'] == 'NULL'):
            dateTillWorked = date.today().strftime("%Y/%m/%d")
        else:
            dateTillWorked = rows[0]['RetirementDate']
        query = "SELECT DATEDIFF(NOW(),RecruitmentDate) AS NO_OF_DAYS_SERVED FROM SOLDIER_DATES WHERE ID='%d'" % (
            ID)
        cur.execute(query)
        rows = cur.fetchall()
        print("Number of days served : ")
        printRowsAsLine(rows)
    except Exception as e:
        con.rollback()
        print("DATABASE ERROR! Error code: ", e)
        return -1


def allLogin(ID):
    try:
        old_passe = input("Enter old password: ")
        new_passe = input("Enter new password: ")
        cur.execute("SELECT ID,Pass FROM SOLDIER_LOGIN WHERE ID='%d' AND Pass='%s'" % (
            ID, old_passe))
        rows = cur.fetchall()
        if(rows == ()):
            print("INVALID USERNAME/PASSWORD")
            return -1
        query = "UPDATE SOLDIER_LOGIN SET Pass='%s' WHERE ID = '%d' " % (
            new_passe, ID)
        cur.execute(query)
        con.commit()
    except Exception as e:
        con.rollback()
        print("DATABASE ERROR! Error code: ", e)


def addMilitaryAccomplishments(ID):
    pass


def soldierFunctions(ID, c):
    if(c == 1):
        displayDetails(ID)
    if(c == 2):
        updateDetails(ID)
    if(c == 3):
        addHealthCheckup(ID)
    if(c == 4):
        allDependency(ID)
    if(c == 5):
        retire(ID)
    if(c == 6):
        promote(ID)
    if(c == 7):
        displayCommander(ID)
    if(c == 8):
        displayPayCheck(ID)
    if(c == 9):
        displayNumberOfDaysServed(ID)
    if(c == 10):
        addMilitaryAccomplishments(ID)
    if(c == 11):
        allLogin(ID)


def additionalFunctions(ID):
    pass


def getSoldierName(ID):
    try:
        query = "SELECT CONCAT(FirstName,\" \",MiddleInitial,\" \",LastName) AS names FROM SOLDIER_PERSONAL WHERE ID='%d' " % (
            ID)
        cur.execute(query)
        rows = cur.fetchall()
        return rows[0]['names']
    except Exception as e:
        con.rollback()
        print("DATABASE ERROR! Error code: ", e)
        return -1


def soldierMenu(ID):
    while(1):
        namez = getSoldierName(ID)
        tmp = sp.call('clear', shell=True)
        print("WELCOME ", namez)
        print()
        print("1.  Display your details")
        print("2.  Update your details")
        print("3.  Perform a medical checkup")
        print("4.  Manage dependencies")
        print("5.  Retire")
        print("6.  Promote another soldier")
        print("7.  Display the commander contact details")
        print("8.  Display the pay check of this month")
        print("9.  Display number of days worked")
        print("10. Manage login information (Change password)")
        print("11. Additional functions")
        print("12. Back")
        c = int(input("\nEnter choice: "))
        tmp = sp.call('clear', shell=True)
        if c == 12:
            break
        elif c == 11:
            additionalFunctions(ID)
        else:
            soldierFunctions(ID, c)
        tmp = input("\nEnter any key to CONTINUE>")


if __name__ == "__main__":
    while(1):
        tmp = sp.call('clear', shell=True)
        print("Enter the SQL server details: ")
        username = input("Username: ")
        password = input("Password: ")
        try:
            con = pymysql.connect(host='localhost',
                                  user=username,
                                  password=password,
                                  db='ARMY',
                                  cursorclass=pymysql.cursors.DictCursor)
            tmp = sp.call('clear', shell=True)
            if(con.open):
                print("Connected")
            else:
                print("Failed to connect")
            tmp = input("\nEnter any key to CONTINUE>")
            with con:
                cur = con.cursor()
                while(1):
                    tmp = sp.call('clear', shell=True)
                    print("INDIAN ARMY MANAGEMENT SYSTEM")
                    print("\nSELECT YOUR OPTION: ")
                    print("1. View the list of all the ranks")
                    print(
                        "2. View the list of all the commands along with the names of the Commanding-in-Chief in charge of it")
                    print("3. Recruit a soldier into the system")
                    print("4. View the list of martyred soldiers")
                    print(
                        "5. Display the number of soldiers recruited, killed and retired in the year given.")
                    print("6. Log into the system")
                    print("7. Exit")
                    c = int(input("\nEnter choice: "))
                    tmp = sp.call('clear', shell=True)
                    if c == 7:
                        break
                    elif c == 6:
                        ID = loginSoldier()
                        if(ID != -1):
                            soldierMenu(ID)
                    else:
                        outsiderFunctions(c)
                    tmp = input("\nEnter any key to CONTINUE>")
        except:
            tmp = sp.call('clear', shell=True)
            print("Connection Refused: Either username or password is incorrect or user doesn't have access to database or the database does not exist")
            print("Please run something and make it work")
            tmp = input("\nEnter any key to CONTINUE>")
