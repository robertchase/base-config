import argparse
import sys
from ergaleia.to_args import to_args

parser = argparse.ArgumentParser()
parser.add_argument('-k', '--key')
cargs = parser.parse_args()

for line in sys.stdin.readlines():
    args, kwargs = to_args(line)
    if cargs.key:
        print(kwargs.get(cargs.key))
    else:
        a = ' '.join(str(a) for a in args)
        k = ' '.join('{}=*'.format(k) for k in kwargs.keys())
        print('{} {}'.format(a, k))
