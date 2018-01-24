import sys
from ergaleia.to_args import to_args

for line in sys.stdin.readlines():
    args, _ = to_args(line)
    print(' '.join(str(a) for a in args))
