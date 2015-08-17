int get_gcd(int big, int small)
{
    while (1) {
        big %= small;
        if (big == 0) return small;
        if (big == 1) return 1;
        small %= big;
        if (small == 0) return big;
        if (small == 1) return 1;
    }
}