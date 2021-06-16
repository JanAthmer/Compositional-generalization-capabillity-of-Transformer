def main():
    with open("input.txt", "r") as f:
        lines = f.readlines()
    with open("input.txt", "w") as f:
        for line in lines:
            if line.strip("\n") != "IN: turn left OUT: I_TURN_LEFT":
                f.write(line)
            else:
                 f.write("IN: churn y OUT: I_CHURN_Y \n")
    print("completed")
main()
