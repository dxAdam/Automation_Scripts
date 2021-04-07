intval = int(input("Enter integer value: "))

byteArr = intval.to_bytes((intval.bit_length() + 7) // 8, byteorder='little', signed=False)

for i in range(0, len(byteArr)):
    print("0x" + str(hex(byteArr[i])[2:].zfill(2)) + "  " + bin(byteArr[i])[2:].zfill(8))

