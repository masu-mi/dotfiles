#!/usr/bin/env python3

def check_number(digits):
    _sum = 0
    alt = False
    for d in reversed(digits.encode()):
        d = d - b'0'[0]
        assert 0 <= d <= 9
        if alt:
            d *= 2
            if d > 9:
                d -= 9
        _sum += d
        alt = not alt
    return (_sum % 10) == 0


if __name__ == "__main__":
    import sys
    print(check_number(sys.argv[1]))
