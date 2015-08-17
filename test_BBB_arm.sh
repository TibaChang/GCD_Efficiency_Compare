cp ./Makefile_BBB ./Makefile
rm -r ./result
mkdir ./result

cp -f ./get_gcd_Euclidean_arm_v1.s ./get_gcd.s
make clean && make gcd
./gcd
cp ./result.txt ./result/get_gcd_Euclidean_arm_v1_result.txt
#######################################
cp -f ./get_gcd_mod_arm_v2.s ./get_gcd.s
make clean && make gcd
./gcd
cp ./result.txt ./result/get_gcd_mod_arm_v2_result.txt
#######################################
cp -f ./get_gcd_arm_v3.s ./get_gcd.s
make clean && make gcd
./gcd
cp ./result.txt ./result/get_gcd_arm_v3_result.txt