# Task 1
cat -An /etc/*.* 2>err.txt etc.txt
# Task 2
ls -al /etc | cut -c 1-10

find /home/oleg/*.* -printf "%M:%f\n"
find /home/oleg/*.* -printf "%M:%f\n" | cut -d ":" -f 1,2 | sort -d
find /etc/*.* -printf "%M\n" | sort -d | uniq

