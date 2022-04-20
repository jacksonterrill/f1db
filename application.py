from sys import exit
import pymysql

def work():
    
    # connect to the sql database
    try:
        cnx = pymysql.connect(host = 'localhost',
                              user = input("What is your username? "),
                              password = input("What is your password? "),
                              db = 'f1db',
                              cursorclass = pymysql.cursors.DictCursor )
    except pymysql.Error as e:
        print('Conn refused, Error" %d %s' % (e.args[0], e.args[1]))
        exit()
    
    # create list of tables
    table_lst = []
    cur = cnx.cursor()
    cur.execute("SHOW tables;")
    myresult = cur.fetchall()
    for each in myresult:
        table_lst.append(each['Tables_in_f1db'].upper())
        
        
    # create default_question
    default_question = "Would you like to CREATE, READ, UPDATE, DELETE, or EXIT ? "
    option = input(default_question)
    print()
    
    
    # keep program running until exit is chosen
    while option.upper().strip() != "EXIT":
            
        # if create is chosen
        if option.upper().strip() == "CREATE":
            
            # give list of tables
            for each in table_lst:
                print(each)
            
            # prompt for table
            table_chosen = input("Out of the tables above, which would you like to create a new tuple for? ")
        
            
            # check if table name is in the table list
            if table_chosen.upper().strip() in table_lst:
               
                # create statement to show columns
                col_stmt = "DESCRIBE " + table_chosen.upper().strip()
                
                # execute select statement
                try:
                    cur = cnx.cursor()
                    cur.execute(col_stmt)
                    
                    # print each column and add each to a list
                    fields_lst = []
                    type_lst = []
                    for row in cur.fetchall():
                        if row["Extra"] == "auto_increment":
                            pass
                        else:
                            fields_lst.append(row["Field"])
                            type_lst.append(row["Type"])
               
                    print(fields_lst)
                # give error message if goes wrong
                except pymysql.Error as e:
                    print('SELECT failed, Error" %d %s' % (e.args[0], e.args[1]))
                    exit()
                
                # collect values for each column
                value_lst = []
                i = 0
                for each in fields_lst:
                    create_value = input("What is the value for " + each + \
                                         " ( " + type_lst[i] + " ) ? ")
                    value_lst.append("'" + create_value.strip() + "'")
                    i += 1
                
                # insert into table
                joined_columns = ",".join(fields_lst)
                joined_values = ",".join(value_lst)
                insert_stmt = "INSERT INTO " + table_chosen.upper().strip() +\
                    "(" + joined_columns + ") VALUES (" + joined_values + ")"
                
                # try to execute insert command
                try:
                    cur = cnx.cursor()
                    cur.execute(insert_stmt)
                    print()
                    print("Tuple has been created!")
                    
                # if insert command doesnt work then display error
                except pymysql.Error as e:
                    print('CREATE failed, Error" %d %s' % (e.args[0], e.args[1]))
                    exit()
                    
            # give error message if table name is invalid 
            else:
                print('Conn refused, invalid table name')
                exit()
                
            # reask default question
            option = input(default_question)
            
        # if read is chosen
        elif option.upper().strip() == "READ":
            
            # give list of tables
            for each in table_lst:
                print(each)
                
            # prompt for table
            table_chosen = input("Which table from above would you like to read? ")
            
            # check if table is in the list
            if table_chosen.upper().strip() in table_lst:
                
                # enter select statement
                stmt_select = "select * from " + table_chosen.upper().strip()
                
                # execute select statement
                try:
                    cur = cnx.cursor()
                    cur.execute(stmt_select)
                    
                    # print each row
                    for row in cur.fetchall():
                        print(row)
               
                # give error message if goes wrong
                except pymysql.Error as e:
                    print('SELECT failed, Error" %d %s' % (e.args[0], e.args[1]))
                    exit()
            
            # if given wrong table name, give error
            else:
                print('Conn refused, invalid table name')
                exit()
            
            # reask default question
            option = input(default_question)
           
        # if update is chosen
        elif option.upper().strip() == "UPDATE":
            
            # give list of tables
            for each in table_lst:
                print(each)
                
            # prompt for table
            table_chosen = input("Which table from above would you like to update? ")
            
            # TODO: run a procedure/function/trigger to update a tuple
            if table_chosen.upper().strip() in table_lst:
                pass
            else:
                print('Conn refused, invalid table name')
                exit()
            
            # reask default question
            option = input(default_question)
    
        # if delete is chosen
        elif option.upper().strip() == "DELETE":
            
            # give list of tables
            for each in table_lst:
                print(each)
                
            # prompt for table
            table_chosen = input("Which table from above would you like to delete a tuple from? ")
            
            # TODO: run a procedure/function/trigger to delete a tuple
            if table_chosen.upper().strip() in table_lst:
                pass
            else:
                print('Conn refused, invalid table name')
                exit()
                
            # reask default question
            option = input(default_question)
            
        # if none is chosen
        else:
            
            # print error message and close
            print('Conn refused, wrong input selected')
            exit()
    
    # close the program
    cnx.close()
    
        
if __name__ == "__main__":
    work()
