#!/bin/bash
#./ORF_Finder.sh Streptomyces_coelicolor
#$0 = name of the program
#$1 = file to analyze

echo $1
#echo $1 tells the computer to create an output with a givin argument, here there is no arguments.
name=$(echo $1 | cut -d "," -f 1)
#here we are creating a variable for the term name. $name will equal Strep.fna file with everything to the right side of a "," cut out. (note this was not necesarry if we are going to stream line edit the first lien out)
echo $name
#we are outputing the variable for editing.

#foward sequence
sed '3 d' $1 | tr -d '\n' > Fw.txt
#here we are deleting the first liine of the fna file and we are using the transforom command to delete every return (\n) in the fna.

#rev
sed '3 d' $1 | tr -d '\n' | rev | sed 's/a/T/g' | sed 's/t/A/g' | sed 's/g/C/g' | sed 's/c/G/g' | tr A-Z a-z > Rev.txt



#Frame 1
sed -e "s/.\{3\}/&\n/g" Fw.txt | sed 's/taa/@/g' | sed 's/tag/@/g' |  sed 's/tga/@/g' >f1.txt
#sed -e = expression: add the script to the commands
nl < f1.txt | sed 's/\ \ *//g' | tr '\t' '_' > nf1.txt
#here for the f1.txt file, we are first getting rid of the spaces then giving each codon with number, then out puting the edited file to a nf1.txt file
grep "atg" nf1.txt > patgf1.txt
#here we are grepping atg to identify the potition of atg then outputting the location to a patgf1.txt file

for start in $(cat patgf1.txt)
#here we are making "start" equal a read patgf1 file, that consists of all the positions of atg
do

echo $start
grep -A 2000 $start nf1.txt | cut -d "_" -f 2 | tr '\n' ' ' | sed 's/$/\n/g' | cut -d "@" -f 1 | sed 's/$/*/g' | sed -f SED_CODON_AA.txt | tr -d ' ' >> FR1AA.txt
#the loop starts at the position of all atg's. grep -A 2000 will print the number of lines 2000 characters away trailing the atg. then we are going to get rid of the the numbers in the file using cut command.
#ask about 'sed/$/\n/g' -> is $symbol or is it end line?
done
wc -l FR1AA.txt
#echo 'Frame 1-------------------------------------------' | cat - FR1AA.txt > temp && mv temp FR1AA.txt








#Frame 2
cut -c 2- Fw.txt | sed -e "s/.\{3\}/&\n/g" | sed 's/taa/@/g' | sed 's/tag/@/g' |  sed 's/tga/@/g' >f2.txt

nl < f2.txt | sed 's/\ \ *//g' | tr '\t' '_' > nf2.txt
grep "atg" nf2.txt > patgf2.txt

for start in $(cat patgf2.txt)
do

echo $start
grep -A 2000 $start nf2.txt | cut -d "_" -f 2 | tr '\n' ' ' | sed 's/$/\n/g' | cut -d "@" -f 1 | sed 's/$/*/g' | sed -f SED_CODON_AA.txt | tr -d ' ' >> FR2AA.txt

done
wc -l FR2AA.txt
#echo 'Frame 2-------------------------------------------' | cat - FR2AA.txt > temp && mv temp FR2AA.txt










#Frame 3
cut -c 3- Fw.txt | sed -e "s/.\{3\}/&\n/g" | sed 's/taa/@/g' | sed 's/tag/@/g' |  sed 's/tga/@/g' >f3.txt

nl < f3.txt | sed 's/\ \ *//g' | tr '\t' '_' > nf3.txt
grep "atg" nf3.txt > patgf3.txt

for start in $(cat patgf3.txt)
do

echo $start
grep -A 2000 $start nf3.txt | cut -d "_" -f 2 | tr '\n' ' ' | sed 's/$/\n/g' | cut -d "@" -f 1 | sed 's/$/*/g' | sed -f SED_CODON_AA.txt | tr -d ' ' >> FR3AA.txt

done
wc -l FR3AA.txt
#echo 'Frame 3-------------------------------------------' | cat - FR3AA.txt > temp && mv temp FR3AA.txt








#Frame 4
sed -e "s/.\{3\}/&\n/g" Rev.txt | sed 's/taa/@/g' | sed 's/tag/@/g' |  sed 's/tga/@/g' >f4.txt

nl < f4.txt | sed 's/\ \ *//g' | tr '\t' '_' > nf4.txt
grep "atg" nf4.txt > patgf4.txt

for start in $(cat patgf4.txt)
do

echo $start
grep -A 2000 $start nf4.txt | cut -d "_" -f 2 | tr '\n' ' ' | sed 's/$/\n/g' | cut -d "@" -f 1 | sed 's/$/*/g' | sed -f SED_CODON_AA.txt | tr -d ' ' >> FR4AA.txt

done
wc -l FR4AA.txt
#echo 'Frame 4-------------------------------------------' | cat - FR4AA.txt > temp && mv temp FR4AA.txt





#Frame 5
cut -c 2- Rev.txt | sed -e "s/.\{3\}/&\n/g" | sed 's/taa/@/g' | sed 's/tag/@/g' |  sed 's/tga/@/g' >f5.txt

nl < f5.txt | sed 's/\ \ *//g' | tr '\t' '_' > nf5.txt
grep "atg" nf5.txt > patgf5.txt

for start in $(cat patgf5.txt)
do

echo $start
grep -A 2000 $start nf5.txt | cut -d "_" -f 2 | tr '\n' ' ' | sed 's/$/\n/g' | cut -d "@" -f 1 | sed 's/$/*/g' | sed -f SED_CODON_AA.txt | tr -d ' ' >> FR5AA.txt

done
wc -l FR5AA.txt
#echo 'Frame 5-------------------------------------------' | cat - FR5AA.txt > temp && mv temp FR5AA.txt






#Frame 6
cut -c 3- Rev.txt | sed -e "s/.\{3\}/&\n/g" | sed 's/taa/@/g' | sed 's/tag/@/g' |  sed 's/tga/@/g' >f6.txt

nl < f6.txt | sed 's/\ \ *//g' | tr '\t' '_' > nf6.txt
grep "atg" nf6.txt > patgf6.txt

for start in $(cat patgf6.txt)
do

echo $start
grep -A 2000 $start nf6.txt | cut -d "_" -f 2 | tr '\n' ' ' | sed 's/$/\n/g' | cut -d "@" -f 1 | sed 's/$/*/g' | sed -f SED_CODON_AA.txt | tr -d ' '  >> FR6AA.txt

done
wc -l FR6AA.txt
#echo 'Frame 6-------------------------------------------' | cat - FR6AA.txt > temp && mv temp FR6AA.txt

nl FR1AA.txt | sed 's/^\ \ *//g' | sed "s/^/>frame1./g" | sed 's/stop/*/g' |  tr '\t' '\n' | sed 's/.\{50\}/&\n/g' > FR1aa.txt
nl FR2AA.txt | sed 's/^\ \ *//g' | sed "s/^/>frame2./g" | sed 's/stop/*/g' |  tr '\t' '\n' | sed 's/.\{50\}/&\n/g' > FR2aa.txt
nl FR3AA.txt | sed 's/^\ \ *//g' | sed "s/^/>frame3./g" | sed 's/stop/*/g' |  tr '\t' '\n' | sed 's/.\{50\}/&\n/g' > FR3aa.txt
nl FR4AA.txt | sed 's/^\ \ *//g' | sed "s/^/>frame4./g" | sed 's/stop/*/g' |  tr '\t' '\n' | sed 's/.\{50\}/&\n/g' > FR4aa.txt
nl FR5AA.txt | sed 's/^\ \ *//g' | sed "s/^/>frame5./g" | sed 's/stop/*/g' |  tr '\t' '\n' | sed 's/.\{50\}/&\n/g' > FR5aa.txt
nl FR6AA.txt | sed 's/^\ \ *//g' | sed "s/^/>frame6./g" | sed 's/stop/*/g' |  tr '\t' '\n' | sed 's/.\{50\}/&\n/g' > FR6aa.txt

cat FR1aa.txt FR2aa.txt FR3aa.txt FR4aa.txt FR5aa.txt FR6aa.txt > Streptomyces_coelicolor_ORF_RESULTS.txt
#nl Streptomyces_coelicolor_ORF_RESULTS.txt | sed 's/^\ \ *//g' | sed "s/^/>/g" | sed 's/stop/*/g' |  tr '\t' '\n' | sed 's/.\{50\}/&\n/g' > Streptomyces_coelicolor_ORF_RESULTS6.txt



awk '{ if ( $0 ~ /^gi/ ) {gsub(" ","_",$0); print ">"$0 } else { print } }' Streptomyces_coelicolor_ORF_RESULTS.txt > Streptomyces_coelicolor_ORF_RESULTS3.fasta
# change ORF txt file to ORF fasta file

rm Streptomyces_coelicolor_ORF_RESULTS.txt
rm FR1AA.txt
rm FR2AA.txt
rm FR3AA.txt
rm FR4AA.txt
rm FR5AA.txt
rm FR6AA.txt
rm f1.txt
rm Fw.txt
rm nf1.txt
rm Rev.txt
rm patgf1.txt
rm f2.txt
rm nf2.txt
rm patgf2.txt
rm f3.txt
rm nf3.txt
rm patgf3.txt
rm f4.txt
rm nf4.txt
rm patgf4.txt
rm f5.txt
rm nf5.txt
rm patgf5.txt
rm f6.txt
rm nf6.txt
rm patgf6.txt






