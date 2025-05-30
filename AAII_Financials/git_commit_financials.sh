echo "Adding Yearly xlsx"

alphabets='A B C D E F G H I J K L M N O P Q R S T U V W X Y Z'
alphabets_subloop='A B C D E F G H I J K L M N O P Q R S T U V W X Y Z'

for chrs in $alphabets
do
  if  [ $chrs = "A" ] || [ $chrs = "B" ] || [ $chrs = "C" ] || [ $chrs = "M" ] || [ $chrs = "P" ] || [ $chrs = "S" ]
  then
    echo "Doing [$chrs]...Will loop through subloop"
    for chrs_subloop in $alphabets_subloop
    do
      echo "Adding the Yearly files that start with ==> [$chrs][$chrs_subloop]*"
      git add Yearly/[$chrs][$chrs_subloop]*.xlsx -v
      echo ""
      echo "Adding Quarterly files that start with ==> [$chrs][$chrs_subloop]*"
      git add Quarterly/[$chrs][$chrs_subloop]*.xlsx -v
      echo ""
    done
	# Sometimes you have the file like A.xlsx
    git add Quarterly/$chrs.xlsx -v
  else
    echo "Adding the Yearly files that start with ==> [$chrs]*"
    git add Yearly/[$chrs]*.xlsx -v
    echo ""
    echo "Adding Quarterly files that start with ==> [$chrs]*"
    git add Quarterly/[$chrs]*.xlsx -v
    echo ""
  fi
done

echo ""
for chrs in $alphabets
do

  if  [ $chrs = "A" ] || [ $chrs = "B" ]  || [ $chrs = "C" ] || [ $chrs = "M" ]  || [ $chrs = "P" ] || [ $chrs = "S" ]
  then
    echo "Doing [$chrs]...Will loop through subloop"
    for chrs_subloop in $alphabets_subloop
    do
      echo "Commiting the Yearly files that start with ==> [$chrs][$chrs_subloop]*"
      ## git commit -m "Updating" Yearly/[$chrs][$chrs_subloop]*.xlsx -v
      git commit -m "Updating" ../AAII_Financials/Yearly/[$chrs][$chrs_subloop]*.xlsx -v
	  git push
      echo ""
      echo "Commiting Quarterly files that start with ==> [$chrs][$chrs_subloop]*"
      ## git commit -m "Updating" Quarterly/[$chrs][$chrs_subloop]*.xlsx -v
      git commit -m "Updating" ../AAII_Financials/Quarterly/[$chrs][$chrs_subloop]*.xlsx -v
	  git push
      echo ""
    done
	# Sometimes you have the file like A.xlsx
    git commit -m "Updating" ../AAII_Financials/Quarterly/$chrs.xlsx -v
  else
    echo "Commiting the Yearly files that start with ==> [$chrs]*"
    ## git commit -m "Updating" Yearly/[$chrs]*.xlsx -v
    git commit -m "Updating" ../AAII_Financials/Yearly/[$chrs]*.xlsx -v
	git push 
    echo ""
    echo "Commiting Quarterly files that start with ==> [$chrs]*"
    ## git commit -m "Updating" Quarterly/[$chrs]*.xlsx -v
    git commit -m "Updating" ../AAII_Financials/Quarterly/[$chrs]*.xlsx -v
	git push
    echo ""
  fi 
done

echo "All done"
