# import statements
from sys import exit
import pymysql
from tabulate import tabulate

# connect to the sql database
def connect():
    try:
        cnx = pymysql.connect(host = 'localhost',
                              user = input("What is your username? "),
                              password = input("What is your password? "),
                              db = 'f1db',
                              cursorclass = pymysql.cursors.DictCursor )
        print("Successfully connected to f1db")
        return cnx
    except pymysql.Error as e:
        print('Connection refused, ERROR %d: %s' % (e.args[0], e.args[1]))
        exit()

# create a tuple in a chosen table
def create(table_chosen, cnx):
    # create statement to show fields
    field_stmt = "DESCRIBE " + table_chosen.strip()

    # execute describe statement
    try:
        cur = cnx.cursor()
        cur.execute(field_stmt)
        # Add each field to a list
        field_list = []
        type_list = []
        for field in cur.fetchall():
            if field["Extra"] != "auto_increment":
                field_list.append(field["Field"])
                type_list.append(field["Type"])
        joined_fields = ", ".join(field_list)
        print("Fields: " + joined_fields)
    # give error message if goes wrong
    except pymysql.Error as e:
        print('DESCRIBE failed, ERROR %d: %s' % (e.args[0], e.args[1]))

    # collect values for each field in the tuple
    value_list = []
    for i in range(len(field_list)):
        value = input("Enter a value for " + field_list[i] + " (" + type_list[i] + "): ")
        value_list.append("'" + value.strip() + "'")
                
    # insert into table
    joined_values = ", ".join(value_list)
    print("New Entry: " + joined_values)
    insert_stmt = "INSERT INTO " + table_chosen.strip() + "(" + joined_fields + ") VALUES (" + joined_values + ")"
                
    # try to execute insert command
    try:
        cur = cnx.cursor()
        cur.execute(insert_stmt)
        cnx.commit() # commit changes to the database
        print("Tuple successfully created!")
    # if insert command doesnt work then display error
    except pymysql.Error as e:
        print('CREATE failed, ERROR %d: %s' % (e.args[0], e.args[1]))

# if read is chosen
def read(table_chosen, cnx):
    # enter select statement
    stmt_select = "SELECT * FROM " + table_chosen.strip()
    # execute select statement
    try:
        cur = cnx.cursor()
        cur.execute(stmt_select)
        # print table
        print("\n" + tabulate(cur.fetchall(), headers="keys", tablefmt="pretty"))
               
    # give error message if goes wrong
    except pymysql.Error as e:
        print('SELECT failed, ERROR %d: %s' % (e.args[0], e.args[1]))

# if update is chosen
def update(table_chosen, cnx):
    read(table_chosen, cnx)
    # create statement to show fields
    field_stmt = "DESCRIBE " + table_chosen.strip()
    # execute describe statement
    try:
        cur = cnx.cursor()
        cur.execute(field_stmt)
        # add fields and their types to lists
        field_list = []
        type_list = []
        for field in cur.fetchall():
            if field["Key"] == "PRI":
                primary_key = field["Field"]
            elif field["Extra"] != "auto_increment":
                field_list.append(field["Field"])
                type_list.append(field["Type"])
        
    # give error message if goes wrong
    except pymysql.Error as e:
        print('DESCRIBE failed, ERROR %d: %s' % (e.args[0], e.args[1]))

    # create statement to find valid primary keys
    valid_keys_stmt = "SELECT " + primary_key + " FROM " + table_chosen.strip()
    # execute statement to find valid primary keys
    try:
        primary_key_list = []
        cur = cnx.cursor()
        cur.execute(valid_keys_stmt)
        # add valid primary keys to list
        for row in cur.fetchall():
            primary_key_list.append(str(row[primary_key]))
    # give error message if goes wrong
    except pymysql.Error as e:
        print('SELECT failed, ERROR %d: %s' % (e.args[0], e.args[1]))

    tuple_chosen = input("\nWhat tuple would you like to update? (Enter primary key) ").strip()
    if tuple_chosen in primary_key_list:
        field_chosen = input("What field would you like to update? ").strip()
        updated_value = input("What value would you like to update that field to? ")
        update_stmt = "UPDATE " + table_chosen + " SET " + field_chosen + " = \'" + updated_value + "\' WHERE " + primary_key + " = " + tuple_chosen
        
        # try to execute update command
        try:
            cur = cnx.cursor()
            cur.execute(update_stmt)
            cnx.commit() # commit changes to the database
            print("Tuple successfully updated!")
        # if update command doesnt work then display error
        except pymysql.Error as e:
            print('UPDATE failed, ERROR %d: %s' % (e.args[0], e.args[1]))
    else:
        print("Invalid primary key")

# if delete is chosen
def delete(table_chosen, cnx):
    read(table_chosen, cnx)
    # create statement to show fields
    field_stmt = "DESCRIBE " + table_chosen.strip()
    # execute describe statement
    try:
        cur = cnx.cursor()
        cur.execute(field_stmt)
        # find primary key for table
        for field in cur.fetchall():
            if field["Key"] == "PRI":
                primary_key = field["Field"]
                
    # give error message if goes wrong
    except pymysql.Error as e:
        print('DESCRIBE failed, ERROR %d: %s' % (e.args[0], e.args[1]))

    # create statement to find valid primary keys
    valid_keys_stmt = "SELECT " + primary_key + " FROM " + table_chosen.strip()
    # execute statement to find valid primary keys
    try:
        primary_key_list = []
        cur = cnx.cursor()
        cur.execute(valid_keys_stmt)
        # add valid primary keys to list
        for row in cur.fetchall():
            primary_key_list.append(str(row[primary_key]))
    # give error message if goes wrong
    except pymysql.Error as e:
        print('SELECT failed, ERROR %d: %s' % (e.args[0], e.args[1]))

    tuple_chosen = input("\nWhat tuple would you like to delete? (Enter primary key) ").strip()
    if tuple_chosen in primary_key_list:
        delete_stmt = "DELETE FROM " + table_chosen + " WHERE " + primary_key + " = " + tuple_chosen
        
        # try to execute update command
        try:
            cur = cnx.cursor()
            cur.execute(delete_stmt)
            cnx.commit() # commit changes to the database
            print("Tuple successfully deleted!")
        # if update command doesnt work then display error
        except pymysql.Error as e:
            print('UPDATE failed, ERROR %d: %s' % (e.args[0], e.args[1]))
    else:
        print("Invalid primary key")

# if driver standings is chosen
def driver_standings(season, cnx):
    # create call statement for driver_standings procedure
    stmt_call = "CALL driver_standings(\"" + season + "\")"
    # execute call statement
    try:
        cur = cnx.cursor()
        cur.execute(stmt_call)
        # print table
        print("\n" + tabulate(cur.fetchall(), headers="keys", tablefmt="pretty"))
               
    # give error message if goes wrong
    except pymysql.Error as e:
        print('SELECT failed, ERROR %d: %s' % (e.args[0], e.args[1]))

# if team standings is chosen
def team_standings(season, cnx):
    # create call statement for team_standings procedure
    stmt_call = "CALL team_standings(\"" + season + "\")"
    # execute call statement
    try:
        cur = cnx.cursor()
        cur.execute(stmt_call)
        # print table
        print("\n" + tabulate(cur.fetchall(), headers="keys", tablefmt="pretty"))
               
    # give error message if goes wrong
    except pymysql.Error as e:
        print('SELECT failed, ERROR %d: %s' % (e.args[0], e.args[1]))

# if driver profiles is chosen
def driver_profiles(cnx):
    # create call statement for driver_profiles procedure
    stmt_call = "CALL driver_profiles()"
    # execute call statement
    try:
        cur = cnx.cursor()
        cur.execute(stmt_call)
        # print table
        print("\n" + tabulate(cur.fetchall(), headers="keys", tablefmt="pretty"))
               
    # give error message if goes wrong
    except pymysql.Error as e:
        print('SELECT failed, ERROR %d: %s' % (e.args[0], e.args[1]))

# create list of tables
def generate_table_list(cnx):
    table_list = []
    cur = cnx.cursor()
    cur.execute("SHOW tables")
    tables = cur.fetchall()
    for table in tables:
        table_list.append(table['Tables_in_f1db'].upper())
    return table_list

# formats a list as a table
def format_list(unformatted_list):
    formatted_list = []
    for item in unformatted_list:
        formatted_list.append([item])
    return(tabulate(formatted_list, tablefmt="pretty"))

if __name__ == "__main__":
    print("Welcome to f1db! A Formula One Database designed by Jackson Terrill and Brady Hobson for CS3200")
    cnx = connect()
    table_list = generate_table_list(cnx)

    # create default_question
    default_question = "\nWould you like to CALCULATE, CREATE, READ, UPDATE, DELETE, or EXIT? "
    option = input(default_question).upper().strip()
    
    # keep program running until exit is chosen
    while option != "EXIT":
        # if calculate is chosen
        if option == "CALCULATE":
            supported_operations = ["DRIVER_STANDINGS", "TEAM_STANDINGS", "DRIVER_PROFILES"]
            supported_seasons = ["2021"]
            print("\n" + format_list(supported_operations))
            operation_chosen = input("\nOut of the operations above, which would you like calculate? ").upper().strip()
            # if driver standings is chosen
            if operation_chosen == "DRIVER_STANDINGS" or operation_chosen == "DRIVER STANDINGS":
                season_chosen = input("\nWhich season would you like to calculate standings for? (Enter year) ").upper().strip()
                if season_chosen in supported_seasons:
                    driver_standings(season_chosen, cnx)
                else:
                    print('Season not supported')
            # if team standings is chosen
            elif operation_chosen == "TEAM_STANDINGS" or operation_chosen == "TEAM STANDINGS":
                season_chosen = input("\nWhich season would you like to calculate standings for? (Enter year) ").upper().strip()
                if season_chosen in supported_seasons:
                    team_standings(season_chosen, cnx)
                else:
                    print('Season not supported')
            # if driver profile is chosen
            elif operation_chosen == "DRIVER_PROFILES" or operation_chosen == "DRIVER PROFILES":
                driver_profiles(cnx)
            # give error message if operation name is invalid 
            else:
                print('Operation not supported')
        # if create is chosen
        elif option == "CREATE":
            # print list of tables
            print("\n" + format_list(table_list))
            # prompt for table
            table_chosen = input("\nOut of the tables above, which would you like to create a new tuple for? ").upper().strip()
            # check if table name is in the table list
            if table_chosen in table_list:
                create(table_chosen, cnx)
            # give error message if table name is invalid 
            else:
                print('Invalid table name')
        # if read is chosen
        elif option == "READ":
            # print list of tables
            print("\n" + format_list(table_list))
            # prompt for table
            table_chosen = input("\nWhich table from above would you like to read? ").upper().strip()
            # check if table is in the list
            if table_chosen in table_list:
                read(table_chosen, cnx)
            # give error message if table name is invalid 
            else:
                print('Invalid table name')
        # if update is chosen
        elif option == "UPDATE":
            # print list of tables
            print("\n" + format_list(table_list))
            # prompt for table
            table_chosen = input("\nWhich table from above would you like to update? ").upper().strip()
            if table_chosen in table_list:
                update(table_chosen, cnx)
            # give error message if table name is invalid 
            else:
                print('Invalid table name')
        # if delete is chosen
        elif option == "DELETE":
            # print list of tables
            print("\n" + format_list(table_list))
            # prompt for table
            table_chosen = input("\nWhich table from above would you like to delete a tuple from? ").upper().strip()
            if table_chosen in table_list:
                delete(table_chosen, cnx)
            else:
                # give error message if table name is invalid 
                print('Invalid table name')
        # if invalid operation is chosen
        else:
            # print error message
            print('Operation not supported')

        # reask default question
        option = input(default_question).upper().strip()

    cnx.close() # close the program
    exit()