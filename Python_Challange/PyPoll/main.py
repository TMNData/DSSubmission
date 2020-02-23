import os
import csv

election_file = os.path.join("Resources","election_data.csv")

# Read using CSV module
# Lists and dictionary to store data

total_vote= []
candidate = []
votes = dict()


with open(election_file, newline="", encoding='utf-8') as csvfile:
#with open(udemy_csv, newline="") as csvfile:

    csvreader = csv.reader(csvfile, delimiter=",")
    csv_header = next(csvreader)
   # print(csv_header)
   
    for row in csvreader:
        # Add votes in list
        total_vote.append(row[0])
    
        #checking for available candidate and adding to dictionary and summing if same candidate
       
        if row[2] not in votes:
            votes[row[2]] = 1
        else:
            votes[row[2]] = votes[row[2]] + 1

    #print(votes)
    vote_count=(len(total_vote))
    #print(vote_count) 
    #print (candidate)   

print("Election Results")
print("-----------------------------------")
print("Total votes: " + str(vote_count))
print("-----------------------------------")
for key, value in votes.items():
	print(key + ": " + str("{:.2%}".format(value / vote_count)) + " (" + str(value) + " votes)")
      
winner = max(votes, key=lambda key: votes[key])
print("-----------------------------------")
print("Winner: " + str(winner))

# open a new text file with "write" mode.
file = open("results.txt", "w")

file.write("Election Results\n")
file.write("-----------------------------\n")
file.write("Total votes: " + str(vote_count)+"\n")
file.write("-----------------------------\n")
for key, value in votes.items():
	file.write(key + ": " + str("{:.2%}".format(value / vote_count)) + " (" + str(value) + " votes)\n")
      
winner = max(votes, key=lambda key: votes[key])
file.write("-----------------------------\n")
file.write("Winner: " + str(winner)+"\n")

# make sure the file is closed
file.close()
