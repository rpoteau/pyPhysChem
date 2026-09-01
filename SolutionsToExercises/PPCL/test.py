# ============================================================
# If... elif tests
# ============================================================

t4pPC.centertxt("1. Even or odd", size=12, weight="bold")
num = int(input("Enter a number: "))
print(num, "is divisible by 2:", num % 2 == 0)

t4pPC.centertxt("2. Weekday name using a list", size=12, weight="bold")
DAY = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
day = int(input("Enter the weekday (1-7): "))
if day < 1 or day > 7:
    print("this weekday does not exist")
else:
    print(DAY[day-1])
