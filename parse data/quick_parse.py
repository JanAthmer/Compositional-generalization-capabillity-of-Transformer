def main():
    target = open("target.txt", "w")
    source = open("source.txt", "w")
    with open('input.txt') as f:
        for line in f:
            x = line.split(" OUT: ")
            y = x[0].split("IN: ")
            x[0] = y[1]
            source.write(x[0])
            source.write("\n")
            target.write(x[1])
    target.close()
    source.close()
    print("completed")
main()
