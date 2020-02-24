import os
import csv

# Referance filepath for file

budget_file = os.path.join("Resources", "budget_data.csv")

# Lists created to store data

net_profit= []
all_month=[]

# Read/open file using CSV module

with open(budget_file, newline="", encoding='utf-8') as csvfile:
    csvreader = csv.reader(csvfile, delimiter=",")
   
   # to move file row refrance to data set excluding header
    
    csv_header = next(csvreader)
   
   
    for row in csvreader:
       
        # Add profit/losst in list
        
        net_profit.append(row[1])
    
        # Add month to list

        all_month.append(row[0])

    print (len(net_profit)) 
    
  # set veriables for sum, max increase and max decrease
greatest_increase = net_profit[0]

greatest_decrease = net_profit[0]

total_profit = 0
#print (net_profit)
#looping through net profit list to comare subsequent values 
# and find max increase max decrease and corrosponding months
for x in range(len(net_profit)):

    total_profit = net_profit[0] + 1

    if net_profit[x] >= greatest_increase:
        greatest_increase = net_profit[x]
    
    elif net_profit[x] <= greatest_decrease:
        greatest_decrease = net_profit[x]

#total_profit = 0

for x in range(len(net_profit)):

    
    #print (total_profit)
    print (greatest_decrease)
    print (greatest_increase)
    exit
    #print (month_decrease)
   # print (month_increase)




