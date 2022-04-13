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
        
            
            # TODO: run a procedure/function/trigger to create a new tuple
            if table_chosen.upper().strip() in table_lst:
                pass
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
            
            # TODO: insert select statement
            if table_chosen.upper().strip() in table_lst:
                pass
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
