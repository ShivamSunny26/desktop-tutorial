print("For Sum press 'a'\n"
      "For Subtraction 's'\n"
      "For Multiplication 'd'\n"
      "For Division 'f'\n")

dir = int(input("Enter direction what you want: "))
   if (dir == 'a'):
      n1 = float(input("Enter the first number: "))
      n2 = float(input("Enter the second number: "))
      s = n1 + n2
      print ("Sum of the two num: ",s)
      break
   if else(dir == 's'):
      n1 = float(input("Enter the first number: "))
      n2 = float(input("Enter the second number: "))
      s = n1 - n2
      print("Difference between the two is: ",s)
      break
   if else(dir== 'd'):
      n1 = float(input("Enter the first number: "))
      n2 = float(input("Enter the second number: "))
      s = n1 * n2
      print("Multiplication of the two number: ",s)
      break
   if else(dir == 'f'):
      n1 = float(input("Enter the first number: "))
      n2 = float(input("Enter the second number: "))
      s = n1 // n2
      d = n1 % n2
      print("Quotent of the two number: ",s)
      print("Reminder of the two number: ",d)
      break
