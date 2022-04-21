from sys import exit
import pymysql

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
        print('Connection refused, ERROR" %d %s' % (e.args[0], e.args[1]))
        exit()

# create a tuple in a chosen table
def create(table_chosen, cnx):
    # create statement to show fields
    field_stmt = "DESCRIBE " + table_chosen.upper().strip()

    # execute describe statement
    try:
        cur = cnx.cursor()
        cur.execute(field_stmt)
        # print each field and add each to a list
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
        print('DESCRIBE failed, ERROR" %d %s' % (e.args[0], e.args[1]))

    # collect values for each field in the tuple
    value_list = []
    for i in range(len(field_list)):
        value = input("Enter a value for " + field_list[i] + " (" + type_list[i] + "): ")
        value_list.append("'" + value.strip() + "'")
                
    # insert into table
    joined_values = ", ".join(value_list)
    print("New Entry: " + joined_values)
    insert_stmt = "INSERT INTO " + table_chosen.upper().strip() + "(" + joined_fields + ") VALUES (" + joined_values + ")"
                
    # try to execute insert command
    try:
        cur = cnx.cursor()
        cur.execute(insert_stmt)
        print("Tuple successfully created!")
    # if insert command doesnt work then display error
    except pymysql.Error as e:
        print('CREATE failed, ERROR" %d %s' % (e.args[0], e.args[1]))

# if read is chosen
def read(table_chosen, cnx):
    # enter select statement
    stmt_select = "SELECT * FROM " + table_chosen.upper().strip()
    # execute select statement
    try:
        cur = cnx.cursor()
        cur.execute(stmt_select)
        # print each row
        for row in cur.fetchall():
            print(row)
               
    # give error message if goes wrong
    except pymysql.Error as e:
        print('SELECT failed, ERROR" %d %s' % (e.args[0], e.args[1]))

# if update is chosen
def update(table_chosen, cnx):
    # TODO: clean up entry validation and error handling
    read(table_chosen, cnx)
    # create statement to show fields
    field_stmt = "DESCRIBE " + table_chosen.upper().strip()
    # execute describe statement
    try:
        cur = cnx.cursor()
        cur.execute(field_stmt)
        # print each field and add each to a list
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
        print('DESCRIBE failed, ERROR" %d %s' % (e.args[0], e.args[1]))

    tuple_chosen = input("What tuple would you like to update? (Enter primary key) ")
    field_chosen = input("What field would you like to update? ")
    updated_value = input("What value would you like to update that field to? ")
    update_stmt = "UPDATE " + table_chosen.upper().strip() + " SET " + field_chosen.upper().strip() + " = \'" + updated_value + "\' WHERE " + primary_key.upper().strip() + " = " + tuple_chosen
    
    # try to execute update command
    try:
        cur = cnx.cursor()
        cur.execute(update_stmt)
        print("Tuple successfully updated!")
    # if update command doesnt work then display error
    except pymysql.Error as e:
        print('UPDATE failed, ERROR" %d %s' % (e.args[0], e.args[1]))

# if delete is chosen
def delete(table_chosen, cnx):
    # TODO: run a procedure/function/trigger to delete a tuple
    return

# create list of tables
def generate_table_list(cnx):
    table_list = []
    cur = cnx.cursor()
    cur.execute("SHOW tables;")
    myresult = cur.fetchall()
    for each in myresult:
        table_list.append(each['Tables_in_f1db'].upper())
    return table_list

if __name__ == "__main__":
    print("Welcome to f1db! A Formula One Database designed by Jackson Terrill and Brady Hobson for CS3200")
    cnx = connect()
    table_list = generate_table_list(cnx)

    # create default_question
    default_question = "\nWould you like to CALCULATE, CREATE, READ, UPDATE, DELETE, or EXIT? "
    option = input(default_question)
    print()
    
    # keep program running until exit is chosen
    while option.upper().strip() != "EXIT":
        # if create is chosen
        if option.upper().strip() == "CREATE":
            # give list of tables
            for table in table_list:
                print(table)
            # prompt for table
            table_chosen = input("\nOut of the tables above, which would you like to create a new tuple for? ")
            # check if table name is in the table list
            if table_chosen.upper().strip() in table_list:
                create(table_chosen, cnx)
            # give error message if table name is invalid 
            else:
                print('Invalid table name')
        # if read is chosen
        elif option.upper().strip() == "READ":
            # give list of tables
            for table in table_list:
                print(table)
            # prompt for table
            table_chosen = input("\nWhich table from above would you like to read? ")
            # check if table is in the list
            if table_chosen.upper().strip() in table_list:
                read(table_chosen, cnx)
            # give error message if table name is invalid 
            else:
                print('Invalid table name')
        # if update is chosen
        elif option.upper().strip() == "UPDATE":
            # give list of tables
            for table in table_list:
                print(table)
            # prompt for table
            table_chosen = input("\nWhich table from above would you like to update? ")
            if table_chosen.upper().strip() in table_list:
                update(table_chosen, cnx)
            # give error message if table name is invalid 
            else:
                print('Invalid table name')
        # if delete is chosen
        elif option.upper().strip() == "DELETE":
            # give list of tables
            for table in table_list:
                print(table)
            # prompt for table
            table_chosen = input("Which table from above would you like to delete a tuple from? ")
            if table_chosen.upper().strip() in table_list:
                delete(table_chosen, cnx)
            else:
                # give error message if table name is invalid 
                print('Invalid table name')
        # if invalid operation is chosen
        else:
            # print error message
            print('Operation not supported')

        # reask default question
        option = input(default_question)

    # close the program
    cnx.commit()
    cnx.close()