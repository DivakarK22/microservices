import psutil
import sys
def checkIfProcessRunning(processName):
    '''
    Check if there is any running process that contains the given name processName.
    '''
    #Iterate over the all the running process
    for proc in psutil.process_iter():
        try:
            # Check if process name contains the given name string.
            if processName.lower() in proc.name().lower():
                return True
        except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
            pass
    return False;

if len(sys.argv) > 1:
    process_name_to_check = sys.argv[1]
    if checkIfProcessRunning(process_name_to_check):
        print(f"The process '{process_name_to_check}' is running.")
    else:
        print(f"The process '{process_name_to_check}' is not running.")
        sys.exit(2)
else:
    print("Please provide a process name as a command-line argument.")
