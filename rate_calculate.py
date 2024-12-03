def calculate():
    num1 = float(input("Weight of the product: "))
    num2 = float(("Rate of the product: "),5750)
    num3 = float(input("Making charge: "))
    
    a = 0;
    result=0;
    a = num1 * num2;
    result = a + a* (num3/100)
    
    print("Amount of the Product: ",a)
    print("Total Amount: ",result)



def main():
    loop = 1
    while loop != 0:
        calculate()
        print("\n")
main()
