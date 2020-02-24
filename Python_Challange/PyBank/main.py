import os
import csv
from statistics import mean

# Referance filepath for file

budget_file = os.path.join("Resources", "budget_data.csv")

# Lists created to store data
# set veriables for sum, max increase and max decrease 
net_profit= []
all_month=[]
total_profit = 0
net_change = []
old_pnl = 0
new_pnl = 0
max_month=""
min_month=""

with open(budget_file, newline="", encoding='utf-8') as csvfile:
    csvreader = csv.reader(csvfile, delimiter=",")
   
   # to move file row refrance to data set excluding header
    
    csv_header = next(csvreader)
   
    for row in csvreader:

        # calculating total by addding profilt loss row

        total_profit += int(row[1])

        #  Add month to list

        all_month.append(row[0]) 

        #Add profit/losst in list
        
        net_profit.append(row[1])
    
#setting up starting value iteratior for subsequent row
i=0
c = 0
list_length = len(net_profit) - 1
for i in range(list_length):
    
    # incrementing to stat at next value
    c = i + 1

    # setting veriable for Old and new profit/Loss

    old_pnl = (net_profit[i])
    new_pnl =(net_profit[c])
    # calculating change in profit/loss
    net_change.append((int(new_pnl) - int(old_pnl)))

#print(net_change)

# defining function to find date relative to max profit loss change

def changelocator(change):
    
    for i in range(len(net_change)): 
        if int(net_change[i])==int(change):
            return all_month[i-1]
            break
        
max_month = changelocator(max(net_change))
min_month = changelocator(min(net_change))
#min_month= changelocator
average_change = mean(net_change)
format_average_cahnge = round (average_change, 2)


# print summary with the results
print("Financial Analysis")
print("--------------------------------------------------------------")
print(f"Total Months: {len(all_month)}")
print(f"Total: ${total_profit}")
print(f"Average Change: ${format_average_cahnge}")
print(f"Greatest Increase in Profits: {max_month} (${max(net_change)})")
print(f"Greatest Decrease in Profits: {min_month} (${min(net_change)})")

# open a new text file with "write" mode.
file = open("results.txt", "w")

file.write("Financial Analysis \n")
file.write ("--" *25)
file.write(f"\nTotal Months: {len(all_month)}\n")
file.write(f"Total: ${total_profit}\n")
file.write(f"Average Change: ${format_average_cahnge}\n")
file.write(f"Greatest Increase in Profits: {max_month} (${max(net_change)})\n")
file.write(f"Greatest Decrease in Profits: {min_month} (${min(net_change)})\n")

# make sure the file is closed
file.close()
