import subprocess
import sys

def check_process(process_name):
    try:
        output = subprocess.check_output(["pgrep", "-f", process_name])
        process_count = len(output.decode().splitlines())
        if process_count > 0:
            print(f"Process '{process_name}' is running")
            return True
        else:
            print(f"No process found with name '{process_name}'")
            return False
    except subprocess.CalledProcessError:
        print("Error executing the command")
        sys.exit(2)
process_name_to_check = sys.argv[1]
check_process(process_name_to_check)
