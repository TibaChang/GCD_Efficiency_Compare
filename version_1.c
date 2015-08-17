int get_gcd(int big, int small)
{
    while (1) {
        if (big > small) big -= small;
        else if (big < small) small -= big;
        else return big;
    }
}