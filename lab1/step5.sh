mm myfile
f r (( i = 1; i <= 1000; i++))
do
  echo $i >> myfile
done
rm first200
head -200 myfile >> first200
rm second200
tail -800 myfile | head -200 >> second200
rm third200
tail -600 myfile | head -200 >> third200
rm fourth200
tail -400 myfile | head -200 >> fourth200
rm fifth200
tail -200 myfile >> fifth200
