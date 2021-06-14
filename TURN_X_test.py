def main():
    with open("source.txt", "r") as f:
        lines = f.readlines()
    with open("source.txt", "w") as f:
        for line in lines:
            f.write(line.replace("turn left", "turn x"))
    print("completed 1/2")

    with open("target.txt", "r") as f:
        lines = f.readlines()
    with open("target.txt", "w") as f:
        for line in lines:
            f.write(line.replace("I_TURN_LEFT", "I_TURN_X"))
    print("completed 2/2")
main()
